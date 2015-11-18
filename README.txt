This R code was written by Steve Stewart in  November 2015 as initial data exploration for a Univ of Chicago Capstone Project.

It was written in R-Studio, and is meant to be stepped through in R-Studio to display and articulate various aspects of Vacancy Events graphically on a map of the city of Chicago.  Finally it will create a table of vacancy events with quadrant on the y axis and year on the x-axis.

Packages
Requires:  ggmap

USer changeable Variables:

1. Working directory (line seven).  Set to point to the directory containing source data.  Source data is 311_Service_Requests_-_Vacant_and_Abandoned_Buildings_Reported.csv and Building_Violations.csv which can both be downloaded from the City of Chicago Data Portal.  The data files are too large to be kept in the code repositry.

2. Set the Latitutinal and Longitudinal size of the quadrants in miles on lines 10 and 11.



Known Issues 
The script occasionally times out pulling the map of the city from OpenStreetMaps  (line 75)