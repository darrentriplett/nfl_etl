# nfl_etl
This repo contains three files which perform Extract Transform Load using the nflscrapR package in R and MySQL.  The extract_nfl.R file extracts nfl statistics using the nflscrapR package from nfl.com and stores the data locally in dataframes.

The transform_nfl.R script cleans up some column names that weren't intuitive and also creates some new tables that will make analysis much easier.  For example, a passing dataframe is created to include only the players who threw a pass in a game.  This dramatically reduces the number of columns needed to store this information by removing the columns in the original table that had nothing to do with passing statistics.

Finally, the load_nfl.R script loads the data from R into a MySQL database using the RMySQL package by creating individual tables for the dataframes and then inserting the data into each.
