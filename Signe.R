#Michael se

setwd("~/Desktop/R studio")
install.packages("tidyverse")
install.packages("dplyr")
library(tidyverse)
library(dplyr)

library(readr)
data <- read_delim("~/Documents/5. semester/Makroøkonomi 3/data.txt", 
                   "\t", escape_double = FALSE, trim_ws = TRUE)
View(data)