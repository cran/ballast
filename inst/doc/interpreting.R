## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----calib--------------------------------------------------------------------
library(ballast)
stress_calibrate(n_per_arm = 30, power = c(0, 0.8), n_trials = 3, seed = 1)

