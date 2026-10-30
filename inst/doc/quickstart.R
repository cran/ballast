## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 8, fig.height = 3)

## ----spec---------------------------------------------------------------------
library(ballast)
dat <- mmrm::fev_data[mmrm::fev_data$USUBJID %in% paste0("PT", 1:100), ]
spec <- stress_spec(dat, response = "FEV1", subject = "USUBJID", visit = "AVISIT",
                    treatment = "ARMCD", reference = "PBO", covariates = ~ RACE + SEX + FEV1_BL,
                    contrast_visit = "VIS4", covariance = "us",
                    method = "Satterthwaite", vcov = "Asymptotic")
spec
stress_fit(spec)

## ----families-----------------------------------------------------------------
stress_covariance(spec, c("us", "cs", "ar1h"))[, c("label", "estimate", "stderr", "p", "is_base")]
stress_inference(spec)[, c("label", "estimate", "stderr", "df", "p")]
stress_covariates(spec)[, c("label", "estimate", "p")]

## ----census-------------------------------------------------------------------
cen <- stress_census(spec, stress_covariance(spec, c("us", "cs", "ar1h")), stress_inference(spec),
                     stress_covariates(spec), stress_loo(spec, by = "RACE"))
summary(cen)
stress_verdict(cen)
plot_swarm(cen)

## ----plan---------------------------------------------------------------------
plan <- stress_plan(spec, covariance = list(structures = c("us", "cs", "ar1h")), inference = list(),
                    covariates = list(), weights = TRUE, loo = list(by = "RACE"), permute = list(n = 99),
                    reference = NULL, estimator = list(estimators = c("complete_cases", "ancova")),
                    fragility = list(max_k = 2))
plan
res <- run_plan(plan, seed = 1)
res

