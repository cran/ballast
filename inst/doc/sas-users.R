## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----spec, eval = FALSE-------------------------------------------------------
# library(ballast)
# # PROC MIXED; CLASS usubjid avisitn trtpn cohort site; MODEL pchg = base avisitn trtpn trtpn*avisitn cohort site / DDFM=SATTERTHWAITE;
# # REPEATED avisitn / SUBJECT=usubjid TYPE=ARH(1); LSMEANS trtpn*avisitn / DIFF;
# spec <- stress_spec(adeff, response = "pchg", subject = "usubjid", visit = "avisitn", treatment = "trtpn",
#                     reference = "1", covariates = ~ base + cohort + site, contrast_visit = "7",
#                     covariance = "ar1h", method = "Satterthwaite", vcov = "Asymptotic")

