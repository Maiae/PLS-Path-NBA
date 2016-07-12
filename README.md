# PLS Path NBA analysis
***
Post published on [TheDataGame.com.au](https://thedatagame.com.au/2016/07/11/success-index-of-nba-teams-using-pls-path-modelling/) blog.  
Based on the book [PLS Path Modeling with R](http://gastonsanchez.com/PLS_Path_Modeling_with_R.pdf)

### Dependencies
```{r}
library(rjson)
library(plspm)
library(colortools)
```  

### Part 1: extracting data from stats.nba.com
First, run the file [NBA_team_data.R](https://github.com/Maiae/PLS-Path-NBA/blob/master/NBA_team_data.R) to extract traditional stats for the 16 teams that took part on the 2015-16 Playoffs.  

### Part 2: running PLS Path Model
Use [NBA_PLS_path.R](https://github.com/Maiae/PLS-Path-NBA/blob/master/NBA_PLS_path.R) to run the PLS Path model.
