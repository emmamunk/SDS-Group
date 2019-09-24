# Data wrangling
rm(list=ls())
library(readr)
library(tidyverse)

# Mathias loading data
library(readr)
data <- read_csv("C:/Users/Emma/OneDrive/Universitetet/9. semester/SDS/M1/loan.csv")
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

#Data vizualizations
library(FactoMineR) #multivariate Exploratory Data Analysis
library(factoextra) #Extract and Visualize the Results of Multivariate Data Analyses
library(ggplot2) #For plotting
library(GGally) #extends 'ggplot2'
library(VIM)
library(mice)
library(reshape2)

#Summarizing data
#After datawrangling, we have to summarize the data. 
head(data[,vars])

#And the variables
glimpse(data[,vars])

ggcorr(data[,vars], label = TRUE, label_size = 3, label_round = 2, label_alpha = TRUE)
#There is only five numeric variables, therefor only five variables. 

ggplot(data, aes(loan_status, ..count..)) + geom_bar()

#Binary variable
library(dummies)

dummy = NULL
data$dummy = dummy[data$loan_status == "Charged off"] = "Yes"
data$dummy = dummy[data$loan_status == "Fully paid"] = "Yes"
data$dummy = dummy[data$loan_status == "Default"] = "No"
data$dummy = na.omit(data, cols="dummy")
data$dummy = as.factor(data$dummy)
data$dummy
