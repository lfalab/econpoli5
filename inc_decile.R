# Add income decile to county data ----------------------------------

dat$inc_decile <- as.factor(ntile(dat$income, 10))
levels(dat$inc_decile) <- c("Bottom Decile",
                            "9th Decile",
                            "8th Decile",
                            "7th Decile",
                            "6th Decile",
                            "5th Decile",
                            "4th Decile",
                            "3rd Decile",
                            "2nd Decile",
                            "Top Decile")