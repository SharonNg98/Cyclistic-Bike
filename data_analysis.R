# Step 0: Load Necessary Packages and Set Working Directory
library(tidyverse)  # helps wrangle data
library(lubridate)  # helps wrangle date attributes
library(ggplot2)  # helps visualize data
library(DescTools) # miscellaneous basic statistics functions
getwd()
setwd("D:/Google Capstone Project/01-Cyclistic Bike/Prepare_CSV")


# Step 1: Collect Data
# Upload divvy datasets (csv)
sep_20 <- read_csv("202009-divvy-tripdata-edited-csv.csv")
oct_20 <- read_csv("202010-divvy-tripdata-edited-csv.csv")
nov_20 <- read_csv("202011-divvy-tripdata-edited-csv.csv")
dec_20 <- read_csv("202012-divvy-tripdata-edited-csv.csv")
jan_21 <- read_csv("202101-divvy-tripdata-edited-csv.csv")
feb_21 <- read_csv("202102-divvy-tripdata-edited-csv.csv")
mar_21 <- read_csv("202103-divvy-tripdata-edited-csv.csv")
apr_21 <- read_csv("202104-divvy-tripdata-edited-csv.csv")
may_21 <- read_csv("202105-divvy-tripdata-edited-csv.csv")
jun_21 <- read_csv("202106-divvy-tripdata-edited-csv.csv")
jul_21 <- read_csv("202107-divvy-tripdata-edited-csv.csv")
aug_21 <- read_csv("202108-divvy-tripdata-edited-csv.csv")


# Step 2: Wrangle Data and Combine into a Single File
# Combining all datasets
all_trips <- rbind(sep_20, oct_20, nov_20, dec_20, jan_21, feb_21,
mar_21, apr_21, may_21, jun_21, jul_21, aug_21)


# Step 3: Clean Up, Modify and Add Data to Prepare for Analysis
# Remove blank rows
all_trips <- na.omit(all_trips)

# Inspect the new table that has been created
colnames(all_trips)  # List of column names
nrow(all_trips)  # How many rows are in data frame?
dim(all_trips)  # Dimensions of the data frame?
head(all_trips)  # See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  # See list of columns and data types (numeric, character, etc)
summary(all_trips)  # Statistical summary of data. Mainly for numerics

# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year 
all_trips$date <- as.Date(all_trips$started_at, format="%d/%m/%Y") # The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")

# Replace variables (numeric) in day_of_week with weekday names
all_trips$day_of_week[all_trips$day_of_week==1] <- "Sunday"
all_trips$day_of_week[all_trips$day_of_week==2] <- "Monday"
all_trips$day_of_week[all_trips$day_of_week==3] <- "Tuesday"
all_trips$day_of_week[all_trips$day_of_week==4] <- "Wednesday"
all_trips$day_of_week[all_trips$day_of_week==5] <- "Thursday"
all_trips$day_of_week[all_trips$day_of_week==6] <- "Friday"
all_trips$day_of_week[all_trips$day_of_week==7] <- "Saturday"

# factor day_of_week into levels
all_trips$day_of_week <- ordered(all_trips$day_of_week,
                                    levels=c("Sunday", "Monday", 
                                             "Tuesday", "Wednesday", 
                                             "Thursday", "Friday", 
                                             "Saturday"))

# Rename member_casual into a more readable name
colnames(all_trips)[colnames(all_trips) == "member_casual"] <- "membership_type"

# Transform ride_length from type time to numeric
all_trips$ride_length <- as.numeric(all_trips$ride_length)


# Step 4: Conduct Descriptive Analysis
# Descriptive analysis on ride_length (all statistics in seconds)
summary(all_trips$ride_length) # a summary including mean, median, max and min ride length
Mode(all_trips$day_of_week) # most frequent bike day

# Average ride_length for member vs casual users by day_of_week
all_trips %>% 
  group_by(membership_type, day_of_week) %>% 
  summarize(avg_ride_time_in_secs=mean(ride_length)) %>%
  ggplot(aes(x=day_of_week, y=avg_ride_time_in_secs,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Average Ride Length for Member vs Casual Users by Day of Week",
       y="Average Ride Time (secs)", x="Day of Week",
       fill="Membership Type")

# Number of rides for member vs casual users by day_of_week
all_trips %>% 
  group_by(membership_type, day_of_week) %>% 
  summarize(number_of_rides=n()) %>%
  ggplot(aes(x=day_of_week, y=number_of_rides,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Number of Rides for Member vs Casual Users by Day of Week",
       y="Number of Rides", x="Day of Week",
       fill="Membership Type")

# Average ride_length for member vs casual users by rideable_type
all_trips %>% 
  group_by(membership_type, rideable_type) %>% 
  summarize(avg_ride_time_in_secs=mean(ride_length)) %>%
  ggplot(aes(x=rideable_type, y=avg_ride_time_in_secs,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Average Ride Length for Member vs Casual Users by Rideable Type",
       y="Average Ride Time (secs)", x="Rideable Type",
       fill="Membership Type")

# Number of rides for member vs casual users by rideable_type
all_trips %>% 
  group_by(membership_type, rideable_type) %>% 
  summarize(number_of_rides=n()) %>%
  ggplot(aes(x=rideable_type, y=number_of_rides,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Number of Rides for Member vs Casual Users by Rideable Type",
       y="Number of Rides", x="Rideable Type",
       fill="Membership Type")
  
# Average ride_length for member vs casual users by month
all_trips %>% 
  group_by(membership_type, month) %>% 
  summarize(avg_ride_time_in_secs=mean(ride_length)) %>%
  ggplot(aes(x=month, y=avg_ride_time_in_secs,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Average Ride Length for Member vs Casual Users by Month",
       y="Average Ride Time (secs)", x="Month",
       fill="Membership Type")

# Number of rides for member vs casual users by month
all_trips %>% 
  group_by(membership_type, month) %>% 
  summarize(number_of_rides=n()) %>%
  ggplot(aes(x=month, y=number_of_rides,
             fill=membership_type)) +
  geom_col(position="dodge") +
  labs(title="Number of Rides for Member vs Casual Users by Month",
       y="Number of Rides", x="Month",
       fill="Membership Type")
