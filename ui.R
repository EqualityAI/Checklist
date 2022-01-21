

####################
# Ben Glicksberg
# Butte Lab / UCSF
# 2018-19
####################
suppressPackageStartupMessages(library(DBI))
suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(shinyWidgets))
suppressPackageStartupMessages(library(shinyjs))
suppressPackageStartupMessages(library(shinyalert))
suppressPackageStartupMessages(library(shinythemes))
suppressPackageStartupMessages(library(shinycssloaders))
suppressPackageStartupMessages(library(plotly))
suppressPackageStartupMessages(library(timevis))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(dplyr))

# options("currentPath" = paste0(getwd(),'//'))
# source("global.R")

##############################################################
############################# UI #############################
##############################################################

ui <- fluidPage(
  #### sets page style
  tags$head(
    tags$style(
      HTML(
        "body{
        height: auto;
        max-width: 1800px;
        margin-left: 250px;
        margin-right:300px;
        }
        .navbar{
        margin-left:250px;
        #margin-right:500px;
        #width:100%;
        max-width:1100px;
        }"
      )
    )
  ),
  navbarPage(div(img(src="img/colwbw.png", height='40', width='30'), "Equality AI"),id="inTabset", ### Navigation bar
             #### HOME tab
             tabPanel("Home",
                      style = "width:100%; margin-left:250px; margin-right:200px",
                      mainPanel(align="center",
                                useShinyjs(),
                                useShinyalert(),
                                fluidPage(theme = shinytheme("paper"),
                                          fluidRow( # intro fluidRow
                                            tags$h3("MLOPs Workflow Checklist"),
                                            # div(img(src="img/linear framework words.PNG", width='75%')),
                                            div(img(src="img/workflow.png", width='55%')),
                                            tags$br(),
                                            tags$p("The Responsible AI Checklist provides a governance framework that is at the heart of the principles of Responsible AI. The Checklist is a tool designed and intended to be used by all organizational entities, from executives to developers, who are involved in the production, application, and lifecycle management of machine learning models.",align="left"),
                                            tags$br(),
                                            fluidRow(
                                              column(width=4, # Help button
                                                     actionButton("gotoHelp","",icon=icon("question-circle","fa-5x"),lib="font-awesome"),
                                                     fluidRow(tags$h5("Help"))),
                                              column(width=4, # About button
                                                     actionButton("gotoAbout","",icon=icon("info-circle","fa-5x"),lib="font-awesome"),
                                                     fluidRow(tags$h5("About"))),
                                              column(width=4, #Configuration button
                                                     actionButton("gotoConfiguration","",icon=icon("download","fa-5x"),lib="font-awesome"),
                                                     fluidRow(tags$h5("Configuration")))),         
                                            tags$hr(),
                                            fluidRow(
                                              column(width=5, # Login column
                                                     tags$h4("Please log-in below:"),
                                                     # Credentials section 
                                                     textInput(inputId="sqlid", label="User ID", value = "", width = NULL, placeholder = "User ID"),
                                                     passwordInput(inputId="sqlpass", label="Password", value = "", width = NULL,placeholder = NULL),
                                                     textInput(inputId="sqlhost", label="Host", value = "", width = NULL, placeholder = "Host"),
                                                     textInput(inputId="sqldb", label="Database", value = "", width = NULL, placeholder = "Database"),
                                                     pickerInput(
                                                       inputId = "driver_picker", 
                                                       label = "Driver",  
                                                       choices = c("MySQL","PostgreSQL", "Amazon Redshift", "Microsoft SQL Server", "Microsoft Parallel Data Warehouse", "Google BigQuery"), 
                                                       selected = "MySQL",
                                                       multiple = FALSE),
                                                     
                                                     textInput(inputId="sqlport", label="Port", value = "", width = NULL, placeholder = "Port"),
                                                     
                                                     fluidRow(column(width=6,
                                                                     actionButton(width = 150,
                                                                                  inputId = "save_credentials",
                                                                                  label = "Save Credentials")),
                                                              column(width=6,
                                                                     actionButton(width =150,
                                                                                  inputId = "load_credentials",
                                                                                  label = "Load Credentials"))),
                                                     HTML("<br>"),
                                                     fluidRow(
                                                       column(width=12,
                                                              directoryInput('directory', label = "", value = getOption("currentPath"))
                                                              # credit: https://github.com/wleepang/shiny-directory-input
                                                       )
                                                     ),  
                                                     HTML("<br>"),
                                                     fluidRow(
                                                       column(width=6,
                                                              disabled(actionButton(width =150,
                                                                                    inputId = "logout",
                                                                                    label = "Logout"
                                                              ))
                                                       ),
                                                       column(width=6,
                                                              actionButton(width = 150,
                                                                           inputId = "login",
                                                                           label = "Login"
                                                              )))     
                                              ), # end Login column
                                              column(width=7)  # end shinyjs:hidden
                                            ) #end fluidRow
                                          )
                                ) # end fluidPage
                      ) # end mainPanel
             ), # end tabpanel Home
             navbarMenu("Define Problem",
                        tabPanel("Project",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(align="center",
                                           useShinyjs(),
                                           useShinyalert(),
                                           fluidPage(theme = shinytheme("paper"),
                                                     fluidRow(align="center",tags$h5("Project details")),
                                                     fluidRow(align = "left",
                                                              
                                                              textInput(inputId = "inputPurpose", 
                                                                        label = "Project Title or Objective"
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              checkboxGroupInput(
                                                                inputId = "inputStakeholders",
                                                                label = "Expected stakeholders",
                                                                choices = c("Patients", "Providers professionals and institutions)", "Payors", "Policymakers"),
                                                                selected = NULL,
                                                                inline = FALSE,
                                                                width = NULL,
                                                                choiceNames = NULL,
                                                                choiceValues = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              checkboxGroupInput(
                                                                inputId = "inputHarm",
                                                                label = "Types of Harm",
                                                                choices = c("Allocation", "Quality of service", "Stereotyping", "Denigration","Over- or underrepresentation"),
                                                                selected = NULL,
                                                                inline = FALSE,
                                                                width = NULL,
                                                                choiceNames = NULL,
                                                                choiceValues = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              textInput(inputId = "inputTradeoffs", 
                                                                       label = "Trade Offs (expected benefits and potential harms)"
                                                              )
                                                              
                                                              # textAreaInput("inputTradeoffs", "Trade Offs (expected benefits and potential harms)", value = "", rows = 5, resize = "both", height = "80px") %>%
                                                              #   shiny::tagAppendAttributes(style = 'width: 100%;')
                                                              
                                                              
                                                     )
                                           ) # end fluidPage
                                 ) # end mainPanel
                                 
                        ), #end Help section tab
                        tabPanel("Population & Setting",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(align="center",
                                           useShinyjs(),
                                           useShinyalert(),
                                           fluidPage(theme = shinytheme("paper"),
                                                     fluidRow(align="center",tags$h5("Study population and setting")),
                                                     fluidRow(align = "left",
                                                              
                                                              textInput(inputId = "inputPopulation", 
                                                                        label = "Population"),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              textInput(inputId = "inputStudysetting", 
                                                                        label = "Study setting"),
                                                              
                                                              HTML("<br>"),
                                                              
                                                               radioButtons(
                                                                inputId = "inputDatasource",
                                                                label = "Data Source",
                                                                choices = c("EHRs", "Omics", "Sensor", "Claims", "Imaging"),
                                                                selected = NULL,
                                                                inline = FALSE,
                                                                width = NULL,
                                                                choiceNames = NULL,
                                                                choiceValues = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              textInput(inputId = "inputCohortSelection", 
                                                                        label = "Cohort Selection")
                                                              
                                                              ) # end of fluidRow
                                                     )# end of fluidPage
                                           )# end of mainPanel
                                 
                                 )# end ot tabPanel
             ),
             navbarMenu("Construct & Prepare Data",
                        tabPanel("Demographics",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(
                                   fluidRow(align="center",tags$h5("Patient demographic characteristics")),
                                   # fluidRow(tags$p("")),
                                   # tags$br(),
                                   dataTableOutput("tableone")
                                 ) #end Help section mainPanel
                        ), #end Help section tab
                        tabPanel("Data Bias Scanner",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(
                                   fluidRow(align ="center",
                                            column(6, align = "right",
                                                   tags$h5("Data Bias Scanner")),
                                            column(6, align = "left",
                                                   actionButton("scannerbtn", "Run Scanner"))),
                                   fluidRow(
                                     shinyjs::hidden(
                                       div(id = "hideScanner", 
                                           br(),
                                           # legend
                                           fluidRow(
                                             column(3,
                                                    textOutput('detected'),
                                                    tags$head(tags$style("#detected{font-size: 16px;color:black;font-style: bold;background-color:red;text-align:center;}"))),
                                             column(9,
                                                    textOutput('detected_inst'),
                                                    tags$head(tags$style("#detected_inst{font-size: 12px;}")))
                                           ),
                                           fluidRow(
                                             column(3,
                                                    textOutput('green'),
                                                    tags$head(tags$style("#green{font-size: 16px;color:white;font-style: bold;background-color:#35B1FF;text-align:center;}"))),
                                             column(9,
                                                    textOutput('green_inst'),
                                                    tags$head(tags$style("#green_inst{font-size: 12px;}")))
                                           ),
                                           hr(),
                                           
                                           
                                           # start of Historical Bias
                                           fluidRow(
                                             column(3,
                                                    textOutput('histB'),
                                                    tags$head(tags$style("#histB{font-size: 16px;color:black;font-style: bold;}"))),
                                             column(5,
                                                    textOutput('histBdef'),
                                                    tags$head(tags$style("#histBdef{font-size: 12px;}"))),
                                             column(3,
                                                    textOutput('histBr'),
                                                    tags$head(tags$style("#histBr{font-size: 16px;color:black;font-style: bold;background-color:red;text-align:center;}"))),
                                             column(1, align = "right",
                                                    actionButton("histbtn_dropdown", label = "", icon = icon("arrow-circle-down"), class = "btn-xs"))
                                           ),
                                           hr(),
                                           
                                           shinyjs::hidden(
                                             div(id = "histBplt",
                                                 
                                                 fluidRow(column(align = 'left', width = 12, 
                                                                 HTML('<font size="2">Responsible AI should interrogate historical data for unfair allocation of resources with respect to a protected class. The "80 percent rule" is suggested as a crude legal threshold for evidence of "disparate impact", reflecting inequality of outcomes. In classification tasks, this means determining if the proportion of outcomes for all other levels of a protected class are within 80-125% of the most common level of that class. </font>'))),
                                                
                                                 fluidRow(column(width = 12, 
                                                                 plotOutput('indplt'))),
                                                 # fluidRow(column(width = 12, 
                                                 #             textOutput('histBi'),
                                                 #             tags$head(tags$style("#histBi{font-size: 12px;}")))),
                                                 fluidRow(column(width = 12, 
                                                                 tags$head(tags$style(HTML("
                                                                 code {
                                                                 display:block;
                                                                 padding:9.5px;
                                                                 margin:0 0 10px;
                                                                 margin-top:10px;
                                                                 font-size:13px;
                                                                 line-height:20px;
                                                                 background-color:#F5F5F5;
                                                                 border:1px solid rgba(0,0,0,0.15);
                                                                 border-radius:4px;}"))),
                                                                 paste0('Historical data with "equality of outcomes" meet the independence fairness criteria (approximately equal proportions of outcomes for all levels of the protected class). Comparing the majority level of the protected class to the others, we see that 4 out of 5 levels of the protected class fail to meet this criteria. When compared to the majority level of African-American, they show evidence of disparate impact. This leads to questions about whether "disparate treatment" was present, preventing equality of opportunity through structural means. These issues may be explored further by researchers or legal experts. Responsible AI corrects such issues prospectively using algorithms, to create a fair world.'))),
                                                 br()
                                             )),
                                           # end of Historical Bias
                                           
                                           
                                           # start of Representation Bias
                                           fluidRow(
                                             column(3,
                                                    textOutput('repB'),
                                                    tags$head(tags$style("#repB{font-size: 16px;color:black;font-style: bold;}"))),
                                             # tags$div(HTML('<i class="fas fa-user-friends" style = "font-size:16px;color:black;font-style:bold;"> REPRESENTATION BIAS</i>'))),
                                             column(5,
                                                    textOutput('repBdef'),
                                                    tags$head(tags$style("#repBdef{font-size: 12px;}"))),
                                             column(3,
                                                    textOutput('repBr'),
                                                    tags$head(tags$style("#repBr{font-size: 16px;color:black;font-style: bold;background-color:red;text-align:center;}"))),
                                             column(1, align = "right",
                                                    actionButton("repbtn_dropdown", label = "", icon = icon("arrow-circle-down"), class = "btn-xs"))
                                           ),
                                           hr(),
                                           
                                           shinyjs::hidden(
                                             div(id = "repBplt",
                                                 fluidRow(column(width = 12, 
                                                                 plotOutput('repplt')))
                                             ))
                                           # end of Representation Bias
                                           
                                           
                                           ) # end of div
                                     ) # end of hidden
                                     
                                           
                                           
                                           
                                           
                                           
                                   ) # end of fluidRow
                                   ) # end of mainPanel
                        ) # end of tabPanel
             ),
             navbarMenu("Build & Train",
                        tabPanel("Model Architecture",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(
                                   fluidRow(align="center",tags$h5("Model Architecture")),
                                   fluidRow(align = "left",
                                            
                                            textInput(inputId = "inputModeloutput", 
                                                      label = "Model output"
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            checkboxGroupInput(
                                              inputId = "inputTargetuser",
                                              label = "Target user",
                                              choices = c("Patient", "Clinican/Researcher", "Hospital Management Team", "Insurance", "Operations", "Strategy"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            radioButtons(
                                              inputId = "inputCrossvalidationyesno",
                                              label = "Validation",
                                              choices = c("Cross validation", "Data split"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            shinyjs::hidden(
                                              div(id = "hidesplit",
                                                  tags$p("Data splitting (%)", style = "font-size: 14px; font-weight: bold;"),
                                                  sliderInput(inputId = "inputTrain",
                                                              label = "Train",
                                                              min = 0,
                                                              max = 100,
                                                              width = "100%",
                                                              value = 80),
                                                  
                                                  HTML("<br>"),
                                                  
                                                  sliderInput(inputId = "inputValidation",
                                                              label = "Validation",
                                                              min = 0,
                                                              max = 100,
                                                              width = "100%",
                                                              value = 10),
                                                  
                                                  HTML("<br>"),
                                                  
                                                  sliderInput(inputId = "inputTest",
                                                              label = "Test",
                                                              min = 0,
                                                              max = 100,
                                                              width = "100%",
                                                              value = 10))),
                                            shinyjs::hidden(
                                              div(id = "hidecross",
                                                  selectInput(
                                                    inputId = "inputCrossvalidation",
                                                    label = "Cross validation",
                                                    choices = c("K-fold cross-validation", "Holdout", "Repeated random sub-sampling", "Other")
                                                  ))),
                                            
                                            HTML("<br>"),
                                            
                                            shinyjs::hidden(
                                              div(id = "hidecrossother",
                                                  textInput(inputId = "inputCrossvalidationother", 
                                                            label = "If Other is selected, please describe"
                                                  ))),
                                            
                                            HTML("<br>"),
                                            
                                            checkboxGroupInput(
                                              inputId = "inputGoldstandard",
                                              label = "Gold standard",
                                              choices = c("Manual abstraction", "Registry", "Based on research", "None"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            radioButtons(
                                              inputId = "inputModeltask",
                                              label = "Model task",
                                              choices = c("Classification", "Prediction"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            radioButtons(
                                              inputId = "inputArchitectureyesno",
                                              label = "Model Architecture",
                                              choices = c("Glass box", "Black box"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            shinyjs::hidden(
                                              div(id = "hideBlackbox",
                                                  selectInput(
                                                    inputId = "inputBlackbox",
                                                    label = "Black box",
                                                    choices = c('Multi-layer Perceptron', "Convolutional Neural Network", "Recurrent Neural Network", "Transformer", "Gradient Boosting Machine", "Random Forest", "Support Vector Machine", "Ensemble", "Other")
                                                  ))),
                                            
                                            HTML("<br>"),
                                            
                                            shinyjs::hidden(
                                              div(id = "hideGlassbox",
                                                  selectInput(
                                                    inputId = "inputGlassbox",
                                                    label = "Glass box",
                                                    choices = c("Linear Regression", "Logistic or Multinomial Regression", "Survival Analysis", "Naive Bayes", "Decision Tree", "Other")
                                                  ))),
                                            
                                            # if other is selected for the model type
                                            shinyjs::hidden(
                                              div(id = "hideOtherBlackbox",
                                                  
                                                  textInput(inputId = "inputOtherBlackbox", 
                                                            label = "If other, please specify",
                                                            placeholder = ""
                                                  ))),
                                            
                                            shinyjs::hidden(
                                              div(id = "hideOtherGlassbox",
                                                  
                                                  textInput(inputId = "inputOtherGlassbox", 
                                                            label = "If other, please specify",
                                                            placeholder = ""
                                                  ))),
                                            
                                            textInput(inputId = "inputFeatures", label = "Features"),
                                            
                                            
                                            shinyjs::hidden(
                                              div(id = "hid_features_inst",
                                                  absolutePanel(id = "features_inst",
                                                                top = 10, right = 20, width = 300,
                                                                draggable = TRUE,
                                                                wellPanel(
                                                                  
                                                                  tags$table(# puts it on the same line.
                                                                    tags$td(div(style = "font-size: 15px; font-weight: bold;", "Features")),
                                                                    tags$td(div(style = "padding-left: 0px; padding-bottom: 0px; width: 80px",
                                                                                actionButton("btn_features_close", "", icon = icon("times-circle"), class = "btn-lg",
                                                                                             style="color:#428bca; background: Transparent no-repeat; border:none; margin:0px;display:inline;")))
                                                                  ),
                                                                  HTML(
                                                                    markdownToHTML(fragment.only=TRUE, text=c(
                                                                      "Features: List of variables used in the model and how they were used in the model in terms of categories or transformation"))
                                                                  )
                                                                )
                                                                # style = "opacity: 0.92"
                                                  ))), # Features end
                                            
                                            HTML("<br>"),
                                            
                                            checkboxGroupInput(
                                              inputId = "inputMissingness",
                                              label = "How missingness was addressed:",
                                              choices = c("Not assessed", "Imputed", "Dropped from study"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = NULL,
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            )
                                            
                                            ) 
                                 ) #end Help section mainPanel
                        ), #end Help section tab
                        tabPanel("Fairness",
                                 style = "width:100%; margin-left:250px; margin-right:200px",
                                 mainPanel(align="center",
                                           useShinyjs(),
                                           useShinyalert(),
                                           fluidPage(theme = shinytheme("paper"),
                                                     fluidRow(align="center",tags$h5("Fairness Metric")),
                                                     fluidRow(align = "left",
                                                              
                                                              selectInput(
                                                                inputId = "inputmetric1",
                                                                label = "1. Does this resource need to be equally provisioned to each level of the protected class (same number or percent e.g. equal outcomes)?",
                                                                choices = c("No", "Equal Number", "Equal Percent (Equality of Outcomes)"),
                                                                selected = NULL,
                                                                multiple = FALSE,
                                                                selectize = TRUE,
                                                                width = "100%",
                                                                size = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              selectInput(
                                                                inputId = "inputmetric2",
                                                                label = "2. Is the healthcare provider incentivized to ration the resource?",
                                                                choices = c("Yes", "No"),
                                                                selected = NULL,
                                                                multiple = FALSE,
                                                                selectize = TRUE,
                                                                width = "100%",
                                                                size = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              selectInput(
                                                                inputId = "inputmetric3",
                                                                label = "3. Is the patient incentivized to seek or avoid care?",
                                                                choices = c("Seek", "Avoid"),
                                                                selected = NULL,
                                                                multiple = FALSE,
                                                                selectize = TRUE,
                                                                width = "100%",
                                                                size = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              selectInput(
                                                                inputId = "inputmetric4",
                                                                label = "4. What is the population of concern?",
                                                                choices = c("Everyone", "People flagged by algorithm", "People who are truly in need (Equal Opportunity)"),
                                                                selected = NULL,
                                                                multiple = FALSE,
                                                                selectize = TRUE,
                                                                width = "100%",
                                                                size = NULL
                                                              ),
                                                              
                                                              HTML("<br>"),
                                                              
                                                              actionButton("getmetric", "Get metric"),
                                                              
                                                              shinyjs::hidden(
                                                                div(id = "divmetrictable",
                                                                    br(),
                                                                    dataTableOutput("metrictable"), type = 1, color.background = 'white'))
                                                              
                                                              
                                                              
                                                                
                                                              
                                                     )
                                           ) # end fluidPage
                                 ) # end mainPanel
                                 
                                 
                                 )
             ),
             tabPanel("Staged Deployment",
                      style = "width:100%; margin-left:250px; margin-right:200px",
                      mainPanel(align="center",
                                useShinyjs(),
                                useShinyalert(),
                                fluidPage(theme = shinytheme("paper"),
                                          fluidRow(align="center",tags$h5("Staged Deployment")),
                                          fluidRow(align = "left",
                                            
                                            textInput(inputId = "inputOptimization",
                                                      label = "Optimization",
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            radioButtons(
                                              inputId = "inputExternalmodelvalidation",
                                              label = "External model validation",
                                              choices = c("Performed", "Not performed"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = "100%",
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            checkboxGroupInput(
                                              inputId = "inputTransparencyCodeData",
                                              label = "Have code and/or data been shared with the community?",
                                              choices = c("Code", "Sample of data"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = "100%",
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            ),
                                            
                                            HTML("<br>"),
                                            
                                            checkboxGroupInput(
                                              inputId = "inputTransparencyLocation",
                                              label = "If shared, where has it been shared?",
                                              choices = c("Github", "Website"),
                                              selected = NULL,
                                              inline = FALSE,
                                              width = "100%",
                                              choiceNames = NULL,
                                              choiceValues = NULL
                                            )
                                          )
                                ) # end fluidPage
                      ) # end mainPanel
             )# end of Navbar
  ) # end NavbarPage
) # end UI

