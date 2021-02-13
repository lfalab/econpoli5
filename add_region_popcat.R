# Read data ---------------------------------------------------------------
library(tidyverse)
# cty_cov_clean
cty <- as_tibble(read.csv("https://raw.githubusercontent.com/lfalab/econpoli5/main/county_cov_clean.csv"))
# regions
reg <- as_tibble(read.csv("https://raw.githubusercontent.com/lfalab/econpoli5/main/states_regions.csv"))
# subset regions data frame
reg <- reg[,c(1,3)]
# rename regions data frame
names(reg) <- c("state", "region")

# Add region to county data -----------------------------------------------

dat <- cty %>% left_join(reg, by = "state")

# Add population quintile to county data ----------------------------------

dat$pop_cat <- as.factor(ntile(dat$pop, 5))
levels(dat$pop_cat) <- c("Least Populated",
                         "Less Populated",
                         "Mid-range Population",
                         "More Populated",
                         "Most Populated")

# Drop if pop_cat is NA ---------------------------------------------------

dat <- filter(dat, !is.na(pop_cat))

# Remove lingering objects ------------------------------------------------

rm(cty, reg)
