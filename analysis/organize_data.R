#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions
library(haven)
SJSD <- read_sav("analysis/input/SJSD.sav")

sjsd <- subset(SJSD, select=c ("q1a","q1c","q4a","q4c","q5b","q6a","q6c","q13a","q14a","q14b",
                               "q14c","q14d","q14e","q15a","q18c","q24c","q24d"))

# recode time traveled for LBGT gatherings
sjsd$time[sjsd$q1c==1] <- "15 minutes"
sjsd$time[sjsd$q1c==2] <- "30 minutes"
sjsd$time[sjsd$q1c==3] <- "45 minutes"
sjsd$time[sjsd$q1c==4] <- "60 minutes"
sjsd$time[sjsd$q1c==5 | sjsd$q1c==6] <- "90 minutes"
sjsd$time <- factor(sjsd$time, 
                    levels=c("15 minutes", "30 minutes",
                             "45 minutes", "60 minutes",
                             "90 minutes"))

# recode current sexuality 

sjsd$sex_id[sjsd$q18c==1 | sjsd$q18c==2 | sjsd$q18c==3 | sjsd$q18c==4 |
                  sjsd$q18c==5 | sjsd$q18c==6 | sjsd$q18c==7] <- "LGBTQ"
sjsd$sex_id[sjsd$q18c==8] <- "Heterosexual"
sjsd$sex_id[sjsd$q18c==9 | sjsd$q18c==10 | sjsd$q18c==11 | sjsd$q18c==12] <- "Nonbinary"
sjsd$sex_id <- factor(sjsd$sex_id,
                      levels=c("LGBTQ","Heterosexual","Nonbinary"))



 

