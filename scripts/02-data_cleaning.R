#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")
View(raw_data)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")
View(raw_data)

# Select the specified columns and rename AREA_NAME
assault_rate_data <- raw_data |>
  select(AREA_NAME, 
         ASSAULT_RATE_2014, ASSAULT_RATE_2015, ASSAULT_RATE_2016, 
         ASSAULT_RATE_2017, ASSAULT_RATE_2018, ASSAULT_RATE_2019, 
         ASSAULT_RATE_2020, ASSAULT_RATE_2021, ASSAULT_RATE_2022, 
         ASSAULT_RATE_2023) |>
  rename(Neighborhood = AREA_NAME)

# Filter rows for specific neighborhoods
uoft_neighborhoods <- assault_rate_data |>
  filter(Neighborhood %in% c("Kensington-Chinatown", "University", "Bay-Cloverhill", "Annex"))

# View the first few rows of the dataset with renamed variables
head(assault_rate_totals)

# Save the cleaned assault rate data
write_csv(
  x = assault_rate_totals,
  file = "outputs/data/cleaned_data.csv"
)

