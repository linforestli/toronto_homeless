#### Preamble ####
# Purpose: Clean the data downloaded from Open Data Toronto
# Author: Linrong Li
# Data: 31 Jan 2023
# Contact: linrongl.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the shelter flow data and saved it to inputs/data
# - Don't forget to gitignore it!
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
library(zoo)
# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv")
# Just keep some variables that may be of interest
names(raw_data)

reduced_data <- 
  raw_data %>% 
  select(date.mmm.yy., 
         population_group,
         returned_from_housing,
         returned_to_shelter,
         newly_identified,
         moved_to_housing,
         became_inactive,
         actively_homeless)
rm(raw_data)

####Convert the date column to yearmon class so that it could be sorted in calendar order####
reduced_data$date.mmm.yy. <- as.yearmon(reduced_data$date.mmm.yy., format = "%b-%y")

#### Save the cleaned data in a local folder ####
write.csv(x = reduced_data, file = "inputs/data/reduced.csv")


         