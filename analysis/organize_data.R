#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions
library(haven)
SJSD <- read_sav("analysis/input/SJSD.sav")

sjsd <- subset(SJSD, select=c ("q1a","q1c","q4a","q4c","q5b","q6a","q6c","q8a","q13a","q14a","q14b",
                               "q14c","q14d","q14e","q15a","q18c","q24c","q24d"))

# recode time traveled for LBGT gatherings
sjsd$q1c[sjsd$q1c==1] <- "15 minutes"
sjsd$q1c[sjsd$q1c==2] <- "30 minutes"
sjsd$q1c[sjsd$q1c==3] <- "45 minutes"
sjsd$q1c[sjsd$q1c==4] <- "60 minutes"
sjsd$q1c[sjsd$q1c==5 | sjsd$q1c==6] <- "90 minutes"
sjsd$q1c <- factor(sjsd$q1c, 
                    levels=c("15 minutes", "30 minutes",
                             "45 minutes", "60 minutes",
                             "90 minutes"))

# recode current sexual identity 

sjsd$q18c[sjsd$q18c==1 | sjsd$q18c==2 | sjsd$q18c==3 | sjsd$q18c==4 |
                  sjsd$q18c==5 | sjsd$q18c==6 | sjsd$q18c==7] <- "LGBTQ"
sjsd$q18c[sjsd$q18c==8] <- "Heterosexual"
sjsd$q18c[sjsd$q18c==9 | sjsd$q18c==10 | sjsd$q18c==11 | sjsd$q18c==12] <- "Nonbinary"
sjsd$q18c <- factor(sjsd$q18c,
                      levels=c("LGBTQ","Heterosexual","Nonbinary"))


# recode how often an event has been attended

sjsd$q8a[sjsd$q8a==1] <- "Never"
sjsd$q8a[sjsd$q8a==2] <- "Once/Twice a year"
sjsd$q8a[sjsd$q8a==3] <- "Six times a year"
sjsd$q8a[sjsd$q8a==4] <- "Once a month"
sjsd$q8a[sjsd$q8a==5 | sjsd$q8a==6] <- "Once a week or more"
sjsd$q8a <- factor(sjsd$q8a,
                   levels=c("Never","Once/Twice a year","Six times a year","Once a month","Once a week or more"))


