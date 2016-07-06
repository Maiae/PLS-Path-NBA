library(rjson)

# team stats data
teamURL <- paste("http://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2015-16&SeasonSegment=&SeasonType=Playoffs&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision=")

# import from JSON
teamData <- fromJSON(file = teamURL, method="C")

# unlist team data, save into a data frame
teamDataf <-
  data.frame(matrix(
    unlist(teamData$resultSets[[1]][[3]]),
    ncol = 30,
    byrow = TRUE
  ))

# team data headers
colnames(teamDataf) <- teamData$resultSets[[1]][[2]]

# convert columns to numeric
cols.num <- names(teamDataf[, 3:28])
options(digits = 4)
teamDataf[cols.num] <- sapply(teamDataf[cols.num], as.character)
teamDataf[cols.num] <- sapply(teamDataf[cols.num], as.numeric)

# delete last 2 columns
teamDataf$CFPARAMS <- NULL
teamDataf$CFID <- NULL

# names rows and data frame
rownames(teamDataf) <- teamDataf$TEAM_NAME
teamDataf$TEAM_ID <- NULL
teamDataf$TEAM_NAME <- NULL
teamData <- teamDataf

# delete objects
rm(cols.num, teamDataf, teamURL)
