## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 4)

## ----eval = FALSE-------------------------------------------------------------
# library(ballast)
# des <- stress_design(n_per_arm = c(50, 75, 100, 150), delta = c(0, 4.5),
#                      n_visits = 4, sigma = 10, rho = 0.6, dropout = 0.03,
#                      covariance = "ar1h", method = "Satterthwaite", vcov = "Asymptotic",
#                      n_trials = 200, cores = 8)
# des
# plot(des)

## ----message = FALSE----------------------------------------------------------
library(ballast)
des <- stress_design(n_per_arm = c(20, 40), delta = c(0, 6), n_visits = 3, n_trials = 3, loo = FALSE, seed = 2)
des

