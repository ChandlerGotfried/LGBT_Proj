#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions
library(haven)
SJSD <- read_sav("analysis/input/SJSD.sav")

sjsd <- subset(SJSD, select=c ("q1a","q1b","q1c","q4a","q4c","q5b","q6a","q6b","q6c","q13a","q14a","q14b",
                               "q14c","q14d","q14e","q14f","q15a","q18a1","q18a2","q18a3","q18a4","q18a5",
                               "q18c","q24a","q24b","q24c","q24d"))
colnames(sjsd) <- c("attended_event","socialize","travel_time","legal_mil","legal_ssm","phobia_neigh",
                    "conn_comm","same_problems","bond_comm","sex_oreint_import","family",
                    "friends","relig_group","coworkers","neighborhood","soc_media","support_of_fam",
                    "male","female","trans(m-f)","trans(f-m)","other","sex_identity","feel_better",
                    "hopeful","happy","enjoy_life") 


