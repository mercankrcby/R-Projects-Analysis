## Load tidyverse
library(tidyverse)
# Create a tibble (a data frame)
main_data <- tibble()
# Create a temporary rds file
tmprds <- tempfile(fileext=".rds")

# Download 2018-09 data and add to main data
print("Getting 2018-09 data from repository")
download.file("https://github.com/MEF-BDA503/mef-bda503.github.io/blob/master/files/car_data_sep_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-07 data and add to main data
print("Getting 2018-07 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-busraakoc/blob/master/odd_car_sales_data_jul_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-06 data and add to main data
print("Getting 2018-06 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-muharremcakir81/blob/master/Week2/Odd_Retail_Sales_201806.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-05 data and add to main data
print("Getting 2018-05 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-EmreKemerci/blob/master/AssignmentWeek2/data_may_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-04 data and add to main data
print("Getting 2018-04 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-omerbayir/blob/master/week2/odd_car_sales_data_april_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-03 data and add to main data
##In the below rds file was not converted.
##print("Getting 2018-03 data from repository")
##download.file("https://github.com/MEF-BDA503/pj18-Baris-Can-Tayiz/blob/master/odd_car_sales_data_march_18.rds?raw=true",destfile=tmprds)
##main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-02 data and add to main data
print("Getting 2018-02 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-aturhal/blob/master/odd_car_sales_data_feb_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Download 2018-01 data and add to main data
print("Getting 2018-01 data from repository")
download.file("https://github.com/MEF-BDA503/pj18-SerhanSuer/blob/master/odd_car_sales_data_jan_18.rds?raw=true",destfile=tmprds)
main_data <- bind_rows(main_data,readRDS(tmprds))

# Save the final merged RDS file
saveRDS(main_data,file="/Users/macboookair/Desktop/bda/pj18-mkaracabey/MergeDataAndAnalysis/car_data_aggregate.rds")

# Remove temporary file
file.remove(tmprds)

## THE END