rm(list=ls())
library(readr)
library(tidyverse)

data <- read_csv("~/Documents/Kandidat/9. semester/SDS/Gruppeopgave/lending-club-loan-data/loan.csv")

vars <- c("purpose", "term", "issue_d",  "loan_status",
          "loan_amnt", "int_rate", "annual_inc", 
          "total_bc_limit", "emp_length", "home_ownership")


#Variabelbeskrivelse: 


extr_vars <- c("acceptD")

na_vars <- c("id", "member_id")

distinct(tibble(data$loan_status))