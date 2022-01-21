library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyjs)
library(magrittr)
library(dplyr)
library(markdown)
library(shinyDirectoryInput)
library(DT)
library(tableone)

# INPUT DATABASE INFORMATION
# options(mysql = list(
#   "host" = "127.0.0.1",
#   "port" = 3306,
#   "user" = "myuser",
#   "password" = "mypassword"
# ))
# databaseName <- "myshinydatabase"
# table <- "responses"

# bring in metric guidance table
dffair <- readxl::read_excel('table.xlsx', skip = 2)

df <- read.csv('compas-scores-two-years.csv') %>% 
  # dplyr::select(age, c_charge_degree, race, age_cat, score_text, sex, 
  #               priors_count, days_b_screening_arrest, decile_score, is_recid, 
  #               two_year_recid, c_jail_in, c_jail_out) %>% 
  filter(days_b_screening_arrest <= 30) %>%
  filter(days_b_screening_arrest >= -30) %>%
  filter(is_recid != -1) %>%
  filter(c_charge_degree != "O") %>%
  filter(score_text != 'N/A')