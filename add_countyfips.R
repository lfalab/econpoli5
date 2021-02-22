library(tidyverse)
# Read opportunity insights
opi <- as_tibble(read.csv("https://opportunityinsights.org/wp-content/uploads/2018/12/cty_covariates.csv"))
# Add countyfips to opi
opi <- opi %>% 
  mutate(countyfips_ch = paste0(state, sprintf("%03d", county)),
         countyfips = as.numeric(as.character(countyfips_ch))) %>% 
  select(countyfips, 1:ncol(opi))
# Read census data
pop <- as_tibble(read.csv("https://www2.census.gov/programs-surveys/popest/datasets/2010/2010-eval-estimates/co-est2010-totals.csv"))
# Add countyfips to pop
pop <- pop %>% 
  mutate(countyfips_ch = paste0(STATE, sprintf("%03d", COUNTY)),
         countyfips = as.numeric(as.character(countyfips_ch))) %>% 
  select(countyfips, 1:ncol(pop))