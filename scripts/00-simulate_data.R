#### Preamble ####
# Purpose: Simulate the Neighbourhood Crime Rates data set but refining the 158 neighbourhoods  
# Author: Bella MacLean
# Date: Saturday January 20, 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Data sets:
## - https://open.toronto.ca/dataset/neighbourhood-crime-rates/

#### Workspace setup ####
# Install and Load the necessary libraries needed to simulate the data
install.packages("tibble")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
library(tidyr)
library(tibble)
library(dplyr)
library(ggplot2)

# Set seed for reproducibility
set.seed(300)

# Define downtown core neighbourhood names
UofT_neighbourhoods <- c(
  "Kensington-Chinatown",
  "University",
  "Bay-Cloverhill",
  "The Annex"
)

# Simulate data for downtown core neighbourhoods
simulated_data <- tibble(
  Neighbourhood = UofT_neighbourhoods,
  ASSAULT_2014 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2015 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2016 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2017 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2018 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2019 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2020 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2021 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2022 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE),
  ASSAULT_2023 = sample(1:100, length(UofT_neighbourhoods), replace = TRUE)
)

# Summarize data for the two periods
simulated_data <- simulated_data %>% 
  mutate(
    Total_Assault_2014_2018 = ASSAULT_2014 + ASSAULT_2015 + ASSAULT_2016 + ASSAULT_2017 + ASSAULT_2018,
    Total_Assault_2019_2023 = ASSAULT_2019 + ASSAULT_2020 + ASSAULT_2021 + ASSAULT_2022 + ASSAULT_2023
  )

#### Simulate Some Graphs ####
# Bar Graph for 2014-2018 - # of assault per neighbourhood from 2014-2018
ggplot(simulated_data, aes(x=Neighbourhood, y=Total_Assault_2014_2018)) +
  geom_bar(stat="identity", fill="blue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Assaults per Neighbourhood (2014-2018)",
       x="Neighbourhood",
       y="Number of Assaults")

# Bar Graph for 2019-2023 - # of assault per neighbourhood from 2019-2023
ggplot(simulated_data, aes(x=Neighbourhood, y=Total_Assault_2019_2023)) +
  geom_bar(stat="identity", fill="red") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Assaults per Neighbourhood (2019-2023)",
       x="Neighbourhood",
       y="Number of Assaults")

# Running some tests to check the simulated data

# Check that all assault values are between 0 and 100
all_values_in_range <- all(simulated_data[, -1] >= 0 & simulated_data[, -1] <= 100)
print(paste("All assault values between 0 and 100:", all_values_in_range))

# Check that there are exactly 4 neighborhoods
correct_neighborhood_count <- nrow(simulated_data) == 4
print(paste("There are exactly 4 neighborhoods:", correct_neighborhood_count))

print(simulated_data)
