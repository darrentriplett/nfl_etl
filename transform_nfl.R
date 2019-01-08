


#extract necessary columns to create a passing dataframe and then rename some of the columns to more inutitive names
passing <- season_player_games %>%
  filter(pass.att > 0) %>%
  select(Season:pass.twoptm, totalfumbs, recfumbs, fumbslost) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, player_id = playerID, 
         pass_attempts = pass.att, 
         pass_completions = pass.comp, 
         pass_yards = passyds, 
         pass_tds = pass.tds, 
         interceptions = pass.ints, 
         two_point_attempt = pass.twopta, 
         two_point_completion = pass.twoptm, 
         fumbles = totalfumbs, 
         recovered_fumbles = recfumbs, 
         fumbles_lost = fumbslost)

#extract necessary columns to create a rushing dataframe and then rename some of the columns to more inutitive names
rushing <- season_player_games %>%
  filter(rush.att > 0) %>%
  select(Season:name, rush.att:rush.twoptm, totalfumbs, recfumbs, fumbslost) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, 
         player_id = playerID, 
         rush_attempts = rush.att, 
         rush_yards = rushyds, 
         rush_tds = rushtds, 
         rush_long = rushlng, 
         rush_long_td = rushlngtd, 
         two_point_attempt = rush.twopta, 
         two_point_made = rush.twoptm, 
         fumbles = totalfumbs, 
         recovered_fumbles = recfumbs, 
         fumbles_lost = fumbslost)

#extract necessary columns to create a receving dataframe and then rename some of the columns to more inutitive names
receiving <- season_player_games %>%
  filter(recept > 0) %>%
  select(Season:name, recept:rec.twoptm, totalfumbs, recfumbs, fumbslost) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, 
         player_id = playerID, 
         receptions = recept, 
         receiving_yards = recyds, 
         receiving_tds = rec.tds, 
         receiving_long = reclng, 
         receiving_long_td = reclngtd, 
         two_point_target = rec.twopta, 
         two_point_catch = rec.twoptm, 
         fumbles = totalfumbs, 
         recovered_fumbles = recfumbs, 
         fumbles_lost = fumbslost)


#extract necessary columns to create a kick returns dataframe and then rename some of the columns to more inutitive names
kick_return <- season_player_games %>%
  filter(kick.rets > 0) %>%
  select(Season:name, kick.rets:kickret.lngtd, totalfumbs, recfumbs, fumbslost) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, 
         player_id = playerID, 
         kick_returns = kick.rets, 
         return_average = kickret.avg,
         return_tds = kickret.tds, 
         kick_return_long = kick.ret.lng, 
         kick_return_long_td = kickret.lngtd, 
         fumbles = totalfumbs, 
         recovered_fumbles = recfumbs, 
         fumbles_lost = fumbslost)

#extract necessary columns to create a punt returns dataframe and then rename some of the columns to more inutitive names
punt_return <- season_player_games %>%
  filter(punt.rets > 0) %>%
  select(Season:name, punt.rets:puntret.lngtd, totalfumbs, recfumbs, fumbslost) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, 
         player_id = playerID, 
         punt_returns = punt.rets, 
         return_average = puntret.avg, 
         return_tds = puntret.tds, 
         punt_return_long = puntret.lng, 
         punt_return_long_td = puntret.lngtd, 
         fumbles = totalfumbs, 
         recovered_fumbles = recfumbs, 
         fumbles_lost = fumbslost)


#extract necessary columns to create a kicking dataframe and then rename some of the columns to more inutitive names
kicking <- season_player_games %>%
  filter(fga > 0 | xpa > 0) %>%
  select(Season:name, fgm:xppts.tot) %>%
  rename(season = Season, 
         game_id = game.id, 
         team = Team, 
         player_id = playerID, 
         field_goals_made = fgm, 
         field_goals_attempted = fga, 
         field_goal_yards = fgyds, 
         field_goal_points = totpts.fg, 
         extra_points_made = xpmade, 
         extra_points_missed = xpmissed, 
         extra_points_attempted = xpa, 
         extra_points_blocked = xpb, 
         extra_points_total = xppts.tot)

#extract necessary columns to create a kick returns dataframe and then rename some of the columns to more inutitive names
defense <- season_player_games %>%
  filter(tackles > 0 | asst.tackles > 0 | sacks > 0  | defints > 0 | forced.fumbs > 0) %>%
  select(Season:name, tackles:forced.fumbs, recfumbs, totalfumbs, totalrecfumbs, fumbyds) %>%
  rename(game_id = game.id,
         assist_tackles = asst.tackles, 
         interceptions = defints, 
         forced_fumbles = forced.fumbs, 
         recovered_fumbles = recfumbs,
         total_fumbles = totalfumbs,
         total_recovered_fumbles = totalrecfumbs, 
         fumble_yards = fumbyds)

#rename some of the columns to make them more intuitive
nflteams <- nflteams %>%
  rename(primary_color = primary,
         secondary_color = secondary,
         tertiary_color = tertiary,
         quaternary_color = quaternary)