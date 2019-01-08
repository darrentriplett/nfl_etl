

#load the RMySQL library
library(RMySQL)

#create a connection MySQL
con <- dbConnect(MySQL(), 
                 user = "dt",
                 password = "*******",
                 host = 'localhost')

#create the nfl data database
dbSendQuery(con, "CREATE DATABASE nfl_data;")

#switch to the new database
dbSendQuery(con, "USE nfl_data")

#create the teams table
dbSendQuery(con, "
CREATE TABLE teams (
abbr VARCHAR(5) PRIMARY KEY,
team VARCHAR(50),
primary_color VARCHAR(10),
secondary_color VARCHAR(10),
tertiary_color VARCHAR(10),
quaternary_color VARCHAR(10),
division VARCHAR(15));")

#load the nflteams dataframe into the teams table
dbWriteTable(con, "teams", nflteams, append = TRUE, row.names = FALSE) 

#create the scores table
dbSendQuery(con, "
CREATE TABLE scores (
game_id VARCHAR(15) PRIMARY KEY,
date  DATE,
home VARCHAR(3),
away VARCHAR(3),
home_score INT(3),
away_score INT(3),
primary key(GameID));")

#load the game_results dataframe into the scores table
dbWriteTable(con, "scores", game_results, append = TRUE, row.names = FALSE) 

#create drive summaries table
dbSendQuery(con, "
CREATE TABLE drive_summaries (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
game_id INT(15),
drive_number VARCHAR(50),
possession_team VARCHAR(10),
quarter INT(1),
first_downs VARCHAR(10),
result VARCHAR(10),
penalty_yards VARCHAR(15),
yards_gained INT(3),
total_plays  INT(2),
possession_time DATETIME,
start_quarter INT(1),
start_time DATETIME,
start_yardline VARCHAR(8),
start_team VARCHAR(3),
end_quarter INT(1),
end_time DATETIME,
end_yardline VARCHAR(8),
end_team VARCHAR(3));")

#load the drive_summaries dataframe into the drive_summaries table
dbWriteTable(con, "drive_summaries", drive_summaries, append = TRUE, row.names = FALSE) 


#create the passing table
dbSendQuery(con, "
CREATE TABLE passing (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
pass_attempts INT(2),
pass_completions INT(2),
pass_yards INT(3),
pass_tds INT(2),
interceptions INT(2),
two_point_attempt INT(1),
two_point_completion INT(1),
fumbles INT(2), 
recovered_fumbles INT(2),
fumbles_lost INT(2));")


#load the passing dataframe into the passing table
dbWriteTable(con, "passing", passing, append = TRUE, row.names = FALSE)


#create the rushing table
dbSendQuery(con, "
CREATE TABLE rushing (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
rush_attempts INT(2),
rush_yards INT(2),
rush_tds INT(2),
rush_long INT(2),
rush_long_td INT(2),
two_point_attempt INT(2),
two_point_made INT(2),
fumbles INT(2),
recovered_fumbles INT(2),
fumbles_lost INT(2));")


#load the rushing dataframe into the rushing table
dbWriteTable(con, "rushing", rushing, append = TRUE, row.names = FALSE)


#create the receiving table
dbSendQuery(con, "
CREATE TABLE receiving (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
receptions INT(2),
receiving_yards INT(2),
receiving_tds INT(2),
receiving_long INT(2),
receiving_long_td INT(2),
two_point_target INT(2),
two_point_catch INT(2),
fumbles INT(2),
recovered_fumbles INT(2),
fumbles_lost INT(2));")

#load the receiving dataframe in the receiving table
dbWriteTable(con, "receiving", receiving, append = TRUE, row.names = FALSE)


#create the kick_return table
dbSendQuery(con, "
CREATE TABLE kick_return (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
kick_returns INT(2),
return_average INT(2),
return_tds INT(2),
kick_return_long INT(2),
kick_return_long_td INT(2),
fumbles INT(2),
recovered_fumbles INT(2),
fumbles_lost INT(2));")

#load the kick_return dataframe into the kick_return table
dbWriteTable(con, "kick_returns", kick_return, append = TRUE, row.names = FALSE)

#create the kick_return table
dbSendQuery(con, "
CREATE TABLE punt_return (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
punt_returns INT(2),
return_average INT(2),
return_tds INT(2),
punt_return_long INT(2),
punt_return_long_td INT(2),
fumbles INT(2),
recovered_fumbles INT(2),
fumbles_lost INT(2));")

#load the kick_return dataframe into the kick_return table
dbWriteTable(con, "punt_return", punt_return, append = TRUE, row.names = FALSE)

#create the kicking table
dbSendQuery(con, "
CREATE TABLE kicking (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
field_goals_made INT(2),
field_goals_attempted INT(2),
field_goal_yards INT(3),
field_goal_points INT(2),
extra_points_made INT(2),
extra_points_missed INT(2),
extra_points_attempted INT(2),
extra_points_blocked INT(2),
extra_points_total INT(1));")

#load the kicking dataframe into the kicking table
dbWriteTable(con, "kicking", kicking, append = TRUE, row.names = FALSE)

#create the defense table
dbSendQuery(con, "
CREATE TABLE defense (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
season INT(4),
game_id VARCHAR(15),
date DATE,
team VARCHAR(3),
player_id VARCHAR(10),
name VARCHAR(30),
tackles INT(2),
assist_tackles INT(2),
sacks INT(2),
interceptions INT(2),
forced_fumbles INT(2),
recovered_fumbles INT(2),
total_fumbles INT(2),
total_recovered_fumbles INT(2),
fumble_yards INT(3));")



#load the defense dataframe into the defense table
dbWriteTable(con, "defense", defense, append = TRUE, row.names = FALSE)

#close the connection
dbDisconnect(con)