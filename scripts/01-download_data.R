#### Preamble ####
# Purpose: Downloads, saves, and reads data from the OpenDataToronto portal
# Author: Bella MacLean
# Date: 20 January 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

# code taken directly from https://open.toronto.ca/dataset/neighbourhood-crime-rates/

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("dplyr")
install.packages("readr")  

library(opendatatoronto)
library(dplyr)
library(readr) 

install.packages("opendatatoronto")
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

write_csv(data, "inputs/data/raw_data.csv")
