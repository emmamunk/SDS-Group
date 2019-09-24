#SDS ER LIVET
library(dplyr)
library(tidyverse)
library(magrittr)
#Nyt datasæt med de udvalgte variabler
data <- subset(loan, select = c("purpose", "term", "issue_d",  "loan_status",
                                "loan_amnt", "funded_amnt", "funded_amnt_inv", 
                                "int_rate", "annual_inc", "emp_length", "home_ownership"))

#Inspektion af det tilskåret datasæt
data %>% glimpse()


#Ved hurtig inspektion i datasættet, burde der være en række 'n/a' i kolonnen emp_lenght
data$emp_length[data$emp_length=='n/a'] <- NA #Omdøber n/a til NA så R kan registrer missing values 
# - måske ikke nødvendigt

#Fjerner alle NA værdier i datasættet - reducere med 150k ish observationer.
data %<>%
  drop_na(purpose, term, issue_d,loan_status,loan_amnt,funded_amnt,
          funded_amnt_inv,int_rate,annual_inc,emp_length, home_ownership)


#Anvender summarise og gather, for at skabe overblik over 'missing values' 
data %>%
  summarise_all(function(x) sum(is.null(x))) %>% gather()

tid <- c('36 months' = '36', '60 months'='60')
data$issue_d <- as.character((tid[data$]))
