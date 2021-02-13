# Read data
dat <- read.csv("https://opportunityinsights.org/wp-content/uploads/2018/12/cty_covariates.csv")
stfips <- read.csv("https://gist.githubusercontent.com/dantonnoriega/bf1acd2290e15b91e6710b6fd3be0a53/raw/11d15233327c8080c9646c7e1f23052659db251d/us-state-ansi-fips.csv")
ctyfips <- read.csv("https://raw.githubusercontent.com/lfalab/econpoli5/main/cty_fips.csv")
# Load dplyr
library(dplyr)
# Get 4-5 digit FIPS for each county
dat <- dat %>% 
  mutate(countyfips_ch = paste0(state, sprintf("%03d", county)),
         countyfips = as.numeric(as.character(countyfips_ch))) %>% 
  select(-countyfips_ch)
# Left join
cty <- dat %>%
  left_join(stfips[, 1:2], by = c("state" = "st")) %>% 
  left_join(ctyfips, by = "countyfips")