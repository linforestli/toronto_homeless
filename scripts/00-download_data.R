#### Preamble ####
# Purpose: Download the data from Open Data Toronto
# Author: Linrong Li
# Data: 31 Jan 2023
# Contact: linrongl.li@mail.utoronto.ca
# License: MIT
# Any other information needed?

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

####Acquire###
#Data can be found on https://open.toronto.ca/dataset/toronto-shelter-system-flow/
# get package
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
package

# get all resources for this package
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")
resources

# load the latest modified csv file
shelter_data <- filter(resources, row_number()==2) %>% get_resource()

# save the data in a local folder
write.csv(x = shelter_data, file = "inputs/data/raw_data.csv")

