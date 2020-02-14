
#load our libraries we'll need to scrape and manipulate the data
library(nflscrapR)
library(tidyverse)


#Initiate the dataframe to hold the player data
season_player_games <- data.frame()

#Let's pull down the game level player data
for (e in 2009:2019){
  temp_df <- season_player_game(Season = e)
  season_player_games <- bind_rows(season_player_games, temp_df)
}

#this creates an nfl teams dataframe which we'll use in the database
data(nflteams)

#This will pull down the rosters data for each team and each season
team_abrev <- nflteams$abbr
rosters <- data.frame()

for (year in 2009:2019){
  temp_df <- season_rosters(year, team_abrev)
  rosters <- bind_rows(rosters, temp_df)
}


#creates an empty data frame to hold the outcomes of each game
game_results <- data.frame()

#This pulls down the scores for each game
for (e in 2009:2019){
  print(e)
  temp_df <- season_games(Season = e)
  game_results <- bind_rows(game_results, temp_df)
  
}


#We pull out the individual game IDs from the dataframe we just created
game_ids <- game_results$GameID

#create an emtpy dataframe 
drive_summaries <- data.frame()

#loop through each of the game IDs and pull out the drive summary data
for (e in game_ids){
  temp_df <- drive_summary(e)
  drive_summaries <- bind_rows(drive_summaries, temp_df)
  
}

#let's get the play by play data as well

nfl_pbp <- data.frame()
for (e in 2009:2019){
  
  temp_df <- season_play_by_play(Season = e)
  nfl_pbp <- bind_rows(nfl_pbp, temp_df)
  
}

