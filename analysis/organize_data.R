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







 

