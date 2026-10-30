## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 4)

## ----spec---------------------------------------------------------------------
library(ballast)
dat <- mmrm::fev_data[mmrm::fev_data$USUBJID %in% paste0("PT", 1:100), ]
spec <- stress_spec(dat, "FEV1", "USUBJID", "AVISIT", "ARMCD", "PBO", covariates = ~ FEV1_BL,
                    covariance = "us", method = "Satterthwaite", vcov = "Asymptotic")
stress_fit(spec)[, c("estimate", "stderr", "p", "n_subj")]

## ----ref----------------------------------------------------------------------
ref <- stress_reference(spec, m = 5, seed = 1)
ref[, c("label", "estimate", "stderr", "p", "note")]

## ----tip----------------------------------------------------------------------
tp <- stress_tipping(spec, deltas = c(0, -5, -10, -15), m = 5, seed = 1)
tp[, c("label", "estimate", "p", "kind")]
tipping_point(tp)
plot_pcurve(tp, xlab = "Shift applied to imputed active-arm values")

