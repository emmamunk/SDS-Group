# Data wrangling
library(readr)
library(tidyverse)

# Mathias loading data
data <- read_csv("~/Dropbox/lending-club-loan-data/loan.csv")
data <- read_csv("Data/loan.csv")

# Variables to select
vars <- c("purpose", "term", "issue_d",  "loan_status",
          "loan_amnt", "funded_amnt", "funded_amnt_inv", 
          "int_rate", "annual_inc", "emp_length", "home_ownership")

# Missing variable???
extr_vars <- c("acceptD")

# Missing therefore NA
na_vars <- c("id", "member_id")

### Variables
# Above are very basic variables
# We should insert more variables that describe risk
# remove joint loans: annual_inc_joint, as this makes the analysis more complicated. 

### Basic view of data

# 9 Different loan status
distinct(tibble(data$loan_status))
# Read about loan status: https://help.lendingclub.com/hc/en-us/articles/215488038-What-do-the-different-Note-statuses-mean-
# We want to make a binary model

# View of data

# Default (31 observations), which seems weird. 
data %>% 
  select(vars) %>% 
  filter(loan_status %in% c("Default")) %>% 
  str()

# Fully paid (1041952 observations)
data %>% 
  select(vars) %>% 
  filter(loan_status %in% c("Fully Paid")) %>% 
  str()

# Charged Off (261655 observations)
data %>% 
  select(vars) %>% 
  filter(loan_status %in% c("Charged Off")) %>% 
  str()

# I think we need to combine Fully paid and Charged off in some way! 
# Read this for more info: https://www.lendingclub.com/info/demand-and-credit-profile.action


