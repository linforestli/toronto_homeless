#### Preamble ####
# Purpose: Simulate data of indigenous and chronic homelessness in Toronto as well as the flow of homeless people in the shelter system.
# Author: Linrong Li
# Email: linrongl.li@mail.utoronto.ca
# Date: 02 Feburary 2023
# Prerequisites: -

library(tidyverse)

set.seed(666)

simulated_shelter_flow_data <-
  tibble(
    date = seq(as.Date("2020-10-01"), length = 25, by = "1 month"),
    simulated_indigenous =
      rpois(
        n = 25,
        lambda = 300
      ),
    simulated_chronic =
      rpois(
        n = 25,
        lambda = 4000
      ),
    simulated_new_inflow =
      rpois(
        n = 25,
        lambda = 500
      ),
    simulated_returns =
      rpois(
        n = 25,
        lambda = 500
      ),
  )

head(simulated_shelter_flow_data)

### Test the simulated data belong to appopriate class###
simulated_shelter_flow_data$date |> class() == "Date"
simulated_shelter_flow_data$simulated_indigenous %>%  class() == "integer"
simulated_shelter_flow_data$simulated_chronic %>%  class() == "integer"
simulated_shelter_flow_data$simulated_new_inflow %>%  class() == "integer"
simulated_shelter_flow_data$simulated_returns %>%  class() == "integer"

###Test population generated are positive numbers###
simulated_shelter_flow_data$simulated_indigenous %>%  min() >= 0
simulated_shelter_flow_data$simulated_chronic %>%  min() >= 0
simulated_shelter_flow_data$simulated_new_inflow %>%  min() >= 0
simulated_shelter_flow_data$simulated_returns %>%  min() >= 0

###Test the date generated is between October 2020 to October 2022###
simulated_shelter_flow_data$date |> max() == "2022-10-01"
simulated_shelter_flow_data$date |> min() == "2020-10-01"