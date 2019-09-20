# Data wrangling
library(readr)
library(tidyverse)
data <- read_csv("~/Dropbox/lending-club-loan-data/loan.csv")

# Variables to select

vars <- c("loan_amnt", "funded_amnt", "funded_amnt_inv", "term", "int_rate")

# View of data
data %>% 
  filter(loan_status != "Current") %>% 
  select(vars) %>% 
  head()

