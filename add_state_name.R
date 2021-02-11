cty <- read.csv("https://opportunityinsights.org/wp-content/uploads/2018/12/cty_covariates.csv")

fips <- read.csv("https://gist.githubusercontent.com/dantonnoriega/bf1acd2290e15b91e6710b6fd3be0a53/raw/11d15233327c8080c9646c7e1f23052659db251d/us-state-ansi-fips.csv")

cty <- merge(x = cty, 
             y = fips[,1:2], 
             by.x = "state",
             by.y = "st",
             all.x = TRUE)

rm(fips)
