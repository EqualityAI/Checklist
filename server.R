server <- function(session, input, output) {
  
  result <- reactiveValues(metric = NULL)
  
  # send data function
  saveData <- function(data) {
    # Connect to the database
    db <- dbConnect(MySQL(), dbname = databaseName, host = options()$mysql$host, 
                    port = options()$mysql$port, user = options()$mysql$user, 
                    password = options()$mysql$password)
    # Construct the update query by looping over the data fields
    query <- sprintf(
      "INSERT INTO %s (%s) VALUES ('%s')",
      table, 
      paste(names(data), collapse = ", "),
      paste(data, collapse = "', '")
    )
    # Submit the update query and disconnect
    dbGetQuery(db, query)
    dbDisconnect(db)
  }
  
  observeEvent(input$send, {
    saveData()
  })
  # send data function
  
  
  ## table one
  output$tableone <- renderDataTable({
    
    dftone <- select(df, -id, -first, -name, -last, -dob, -compas_screening_date, -c_jail_in, -c_jail_out, -c_case_number, -c_offense_date, -c_arrest_date, -r_case_number, -r_offense_date, -r_jail_in, -r_jail_out, -vr_case_number, -vr_offense_date, -screening_date, -v_screening_date, -in_custody, -out_custody)
    
    colistVars <- colnames(dftone)
    
    catVars <- colnames(select(dftone, sex, age_cat, race, c_charge_degree, c_charge_desc, is_recid, r_charge_degree, r_charge_desc, vr_charge_degree, vr_charge_desc, type_of_assessment, v_score_text, two_year_recid))
    
    x1 <- print(CreateTableOne(vars = colistVars, data = dftone,
                           factorVars = catVars), showAllLevels = T)
    x1 <-data.frame(Characteristic = rownames(x1), x1, stringsAsFactors = F)
    
    x1$overall_count <- as.numeric(gsub("\\(.*", "", x1$Overall))
    x1$overall_pct <- sub("[^(]+\\(([^)]+)\\).*", "\\1", x1$Overall)
    
    x1 %<>% dplyr::select(-Overall)
    
    colnames(x1) <- c("Demographics", 
                      "Categories", 
                      "N", 
                      "(%)")
    
    x1 %>% 
      
      datatable(
        
        # caption = htmltools::tags$caption(style = 'caption-side: bottom; text-align: left;', 
        #                                   'Foot Note: ', htmltools::em(footnote)),
        rownames = FALSE,
        
        options = list(
          list(className = 'dt-left', targets = 0:3),
          searching = FALSE,
          lengthChange = FALSE,
          paging = FALSE,
          info = FALSE) # add commas and stuff here.
      )%>%
      formatCurrency("N", '', digits = 0) %>%
      formatCurrency("(%)", '', digits = 1)
  })
  ## end of table one
  
  # show data scanner
  observeEvent(input$scannerbtn, {
    shinyjs::show("hideScanner")
    
  })
  # end of show data scanner
  
  
  # data scanner
  output$detected <- renderText({'DETECTED'})
  output$detected_inst <- renderText({'If the bias has been detected in the data source, then please see suggestions for how to minimize the following bias.'})
  output$green <- renderText({'UNDETECTED'})
  output$green_inst <- renderText({'The bias is not detected in the data source'})
  
  
  # start of Historical Bias
  output$histB <- renderText({'Historical Bias'})
  output$histBdef <- renderText({'Historical bias arises even if data is perfectly measured and sampled, if the world as it is or was leads to a model that produces harmful outcomes.'})
  output$histBr <- renderText({'DETECTED'})
  
  observeEvent(input$histbtn_dropdown,{
    shinyjs::toggle("histBplt", anim = TRUE)
    if (input$histbtn_dropdown %% 2 == 1) {
      updateActionButton(session, "histbtn_dropdown", icon = icon("arrow-circle-up"))
    } else {
      updateActionButton(session, "histbtn_dropdown", icon = icon("arrow-circle-down"))
    }
  })
  
  output$indplt <- renderPlot({
    threshold_difference <- .2
    comparison_threshold <- c((1-threshold_difference),
                              1/(1-threshold_difference))
    comparison_group <- df$race %>%  table %>% which.max %>% names
    
    t1 <- table(df$race, df$two_year_recid)
    s <- rowSums(t1)
    w1 <- t1 %>% as.data.frame.matrix %>% tibble::rownames_to_column() 
    w1$s <- s
    res1 <- chisq.test(t1)
    
    q1 <- bind_cols(w1, 
                    Hmisc::binconf(w1[,3], w1[,4]) %>% 
                      as.data.frame)
    
    comparison_value <- q1 %>%  filter(rowname==comparison_group) %>% pull(PointEst)
    
    q1$comparsion_value <- comparison_value
    q1$ratios <- q1$PointEst/comparison_value
    
    q1 <- q1 %>%  
      mutate(fail = ifelse(ratios < comparison_threshold[1] | ratios > comparison_threshold[2], 'FAIL', 'PASS'))
    
    plot_lines <- comparison_value*comparison_threshold
    
    q1 %>%  
      ggplot(aes(x=rowname, y = PointEst, fill=rowname))+
      geom_bar(stat="identity",  
               position=position_dodge()) +
      geom_errorbar(aes(ymin=Lower, ymax=Upper), width=.2,
                    position=position_dodge(.9))  + 
      shadowtext::geom_shadowtext(aes(x=rowname, y = comparison_value, label=fail))+ 
      geom_hline(yintercept = plot_lines, lty=2)+
      scale_fill_viridis_d() + 
      ggtitle('Independence Criteria Assessed by Outcome Prevalence by Race', 
              paste0('Fairness Threshold: ' ,threshold_difference) )+
      ylab('Prevalence') + 
      xlab("Race")
  }) 
  
  
  # start of Representation Bias
  output$repB <- renderText({'Representation Bias'})
  output$repBdef <- renderText({'Representation bias occurs when the development sample underrepresents some part of the population, and subsequently fails to generalize well for a subset of the use population.'})
  output$repBr <- renderText({'DETECTED'})
  
  observeEvent(input$repbtn_dropdown,{
    shinyjs::toggle("repBplt", anim = TRUE)
    if (input$histbtn_dropdown %% 2 == 1) {
      updateActionButton(session, "repbtn_dropdown", icon = icon("arrow-circle-up"))
    } else {
      updateActionButton(session, "repbtn_dropdown", icon = icon("arrow-circle-down"))
    }
  })
  
  
  output$repplt <- renderPlot({
    t1 <- df %>%  
      group_by(race) %>%  
      summarise(n=n(), .groups='drop') %>% 
      mutate(m=sum(n))
    
    res1 <- chisq.test(t1$n)
    
    q1 <- bind_cols(t1, 
                    Hmisc::binconf(t1$n, t1$m) %>% 
                      as.data.frame)
    q1 %>%  
      ggplot(aes(x=race, y = PointEst, fill=race))+
      geom_bar(stat="identity",  
               position=position_dodge()) +
      geom_errorbar(aes(ymin=Lower, ymax=Upper), width=.2,
                    position=position_dodge(.9))  +
      scale_fill_viridis_d() + 
      ggtitle('Race Prevalence',
              paste0('Chisq test p-value:', 
                     formatC(res1$p.value, 
                             format = "e", 
                             digits = 2))) +
      ylab('Prevalence') + 
      xlab("Race")
    
  })# end of Representation Bias
  
  # end of the data scanner
  
  
  
  
  
  
  
  
  
  
  
  observeEvent(input$button0, {
    show("second")
  })
  
  observeEvent(input$button1, {
    show("third")
  })
  
  observeEvent(input$button2, {
    show("fourth")
  })
  
  observeEvent(input$button3, {
    show("fifth")
  })
  
  observe({
    if(input$inputCrossvalidationyesno=='Data split'){
      show("hidesplit")
      hide("hidecross")
    } else {
      hide("hidesplit")
      show("hidecross")
    }
  })
  
  observe({
    if(input$inputArchitectureyesno=='Black box'){
      show("hideBlackbox")
      hide("hideGlassbox")
    } else {
      hide("hideBlackbox")
      show("hideGlassbox")
    }
  })
  
  
  # if other is selected for the model type
  observe({
    if(input$inputGlassbox=='Other' & input$inputArchitectureyesno=='Glass box'){
      show("hideOtherGlassbox")
    } else {
      hide("hideOtherGlassbox")
    }
    
  })
  
  # if other is selected for the model type
  observe({
    if(input$inputBlackbox=='Other' & input$inputArchitectureyesno=='Black box'){
      show("hideOtherBlackbox")
    } else {
      hide("hideOtherBlackbox")
    }
    
  })
  
  # if other is selected for cross validation
  observe({
    if(input$inputCrossvalidation=='Other' & input$inputCrossvalidationyesno=='Cross validation'){
      show("hidecrossother")
    } else {
      hide("hidecrossother")
    }
    
  })
  
  dfmetric <- observeEvent(input$getmetric, {
    if(stringr::str_detect(input$inputmetric1, 'Equal')){
      df_filtered <- dffair %>%  
        filter(`1. Does this resource need to be equally provisioned to each level of the protected class (same number or percent e.g. equal outcomes)?`==input$inputmetric1 )
    } else {
      df_filtered <- dffair %>%  
        filter(`1. Does this resource need to be equally provisioned to each level of the protected class (same number or percent e.g. equal outcomes)?`==input$inputmetric1 & 
                 `2. Is the healthcare provider incentivized to ration the resource?` == input$inputmetric2 & 
                 `3. Is the patient incentivized to seek or avoid care?` == input$inputmetric3 & 
                 `4. What is the population of concern?` == input$inputmetric4)
    }# input$inputmetric1
    # input$inputmetric2
    # input$inputmetric3
    # input$inputmetric4
    result$metric<<- df_filtered
    df_filtered
  })
  
  
  output$metrictable <- renderDataTable({
    df <- result$metric %>% select (`Suggested Parity Metric`, `Parity Metric Description`, `Parity Metric Equation`, `The Notion`)
    
      datatable(
        df,
        # caption = htmltools::tags$caption(style = 'caption-side: bottom; text-align: left;', 
        #                                   'Foot Note: ', htmltools::em(footnote)),
        class = "stripe",
        rownames = FALSE,
        
        options = list(
          list(className = 'dt-left', targets = 0:3),
          searching = FALSE,
          lengthChange = FALSE,
          paging = FALSE,
          info = FALSE) # add commas and stuff here.
      )
    
    
    
  })
  
  # show the metric results
  observeEvent(input$getmetric, {
    shinyjs::show("divmetrictable")
    
  })
  
  
}
