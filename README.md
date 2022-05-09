---
Title: "Cyclistic Bike-Share: How Does a Bike-Share Navigate Speedy Success?"
Author: "Sharon Ng"
Date: "2021/9/6"
Output: html_document
---

# Ask
### Three Questions to Guide the Future Marketing Program
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### Business Task
1. What is the frequency of usage among annual members and casual riders respectively?  
2. What actions can be done to convert casual riders to annual members?

### Key Stakeholders
- Lily Moreno - the director of marketing responsible for the development of campaigns and initiatives to promote the bike-share program.  
- Cyclistic Executive Team - holds the decision to approve the recommended marketing program  
- Cyclistic bike-share users - Cyclistic's program change will affect the users' preferences

# Prepare
### How the Data is Organised
The downloaded files are stored in a local drive but not the cloud. The zip files containing the Cyclistic Bike-Share data is then extracted in CSV format. A folder is created to store this original data. An additional folder is created to store XLSX files converted from the CSV files. These two folders act as the original datasets and any modifications to that will not occur.  

### Bias or Credibility
#### Is the Data Reliable, Original, Comprehensive, Current and Cited (ROCCC)?
- Reliable: The data is downloaded from Google Capstone Project via an anonymised company. Since Google is a large, well-known and credible corporate, it is expected and assumed that the data is trustworthy. The files are stored in static form (zip file) instead of dynamic form (cloud), so the data is reliable and does not change without prior notice.
- Original: The data is second-hand but has not been processed by any third-party.
- Comprehensive: Most data files conatin all critical information needed to find the solution. Some data files are missing in start station and its ID, and end station and its ID. This will affect our consideration in how distance and location affect a user's preference in joining the membership.
- Current: The data is current, starting from September 2020 to August 2021.
- Cited: Google cited its source.

### Cleaning the Data
The data is sorted in ascending order by start_date, then end_date, then rideable_type in Excel.

#### Assumptions when cleaning
1. Entries that have 0 difference in both longitude and latitude are deemed invalid because it is abnormal that the location spots didn’t change slight a bit thus are removed.
2. Entries that have ride_length = 00:00:00 or ######## are deemed invalid even if the longitudes and latitudes have changed because the persons have not travelled so they is using the service improperly thus are removed.

# Process
### Tools
Excel for data cleaning, R for data transformation, data analysis and data visualisation

# Analysis
Click here for the [R script](https://github.com/SharonNg98/Cyclistic-Bike-Data-Analysis/blob/master/data_analysis.R).

# Share
![In this graph, casual and member users ride longer on weekends.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Average%20Ride%20Length%20for%20Member%20vs%20Casual%20Users%20by%20Day%20of%20Week.png)  

In this graph, casual and member users ride longer on weekends.
 
![In this graph, casual users ride more frequently on weekends, while member users ride more on Wednesdays.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Number%20of%20Rides%20for%20Member%20vs%20Casual%20Users%20by%20Day%20of%20Week.png)
  
  In this graph, casual users ride more frequently on weekends, while member users ride more on Wednesdays.

![In this graph, casual and member users ride longer on docked bikes.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Average%20Ride%20Length%20for%20Member%20vs%20Casual%20Users%20by%20Rideable%20Type.png)
  
  In this graph, casual and member users ride longer on docked bikes.

![In this graph, casual and member users ride more frequently on classic bikes.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Number%20of%20Rides%20for%20Member%20vs%20Casual%20Users%20by%20Rideable%20Type.png)
  
  In this graph, casual and member users ride more frequently on classic bikes.

![In this graph, the top three months that casual users ride the longest are May, February and September in descending order. Casual members ride the shortest in January and December. Member users ride the longest in February and September.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Average%20Ride%20Length%20for%20Member%20vs%20Casual%20Users%20by%20Month.png)
  
  In this graph, the top three months that casual users ride the longest are May, February and September in descending order. Casual members ride the shortest in January and December. Member users ride the longest in February and September.

![In this graph, the top three months that casual users ride the most  are July, August and June (all summer months) in descending order. Casual members ride the least in January and February. Member users ride the most in July and August.](https://github.com/SharonNg98/Cyclistic-Bike/blob/master/Number%20of%20Rides%20for%20Member%20vs%20Casual%20Users%20by%20Month.png)
  
  In this graph, the top three months that casual users ride the most are July, August and June (all summer months) in descending order. Casual members ride the least in January and February. Member users ride the most in July and August.

# Act
## Three Suggestions to Increase Conversion Rate of Casual Users to Member Users
1. Provide incentives like discounts on weekends.
2. Provide more docked bikes and classic bikes since they are the top two most used bikes in terms of ride length and frequency respectively.
3. Provide incentives like free-hours on the ride time in February, May and September, and giveaways for the frequent use of bikes in June, July and August.
