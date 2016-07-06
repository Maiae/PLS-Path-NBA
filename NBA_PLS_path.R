# Partial Least Squares Path Modeling analysis of NBA team success

library(plspm)
library(colortools)


# save team data pre Game 7 Finals
# save(teamData, file="Team_data_pre_game_7_finals.RData")


# load team data pre Game 7 Finals
load("Team_data_pre_game_7_finals.RData")


# rows of the inner model matrix
Offense = c(0, 0, 0)
Defense = c(0, 0, 0)
Success = c(1, 1, 0)

# path matrix created by row binding
nba_path <- rbind(Offense, Defense, Success)

# add column names (optional)
colnames(nba_path) <- rownames(nba_path)

# plot the path matrix
innerplot(nba_path)

# define list of indicators: what variables are associated with
# what latent variables
nba_blocks <- list(c(8, 11, 14, 15, 18, 24),
                  c(16, 20, 21),
                  c(2, 4, 25, 26))

# all latent variables are measured in a reflective way
nba_modes <- c("A", "A", "A")
nba_modes2 <- c("A", "A", "B")

# run plspm analysis
nba_pls <- plspm(teamData, nba_path, nba_blocks, modes = nba_modes)
summary(nba_pls)


## Model Results
# path coefficients
nba_pls$path_coefs

# inner model
nba_pls$inner_model

# plotting results (inner model)
plot(nba_pls)

# plotting loadings of the outer model
plot(nba_pls, what = "loadings", arr.width = 0.1)

# index of success
View(nba_pls$scores)