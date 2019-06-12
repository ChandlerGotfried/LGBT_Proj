#' ---
#' title: "organize_data.R"
#' author: ""
#' ---

# This script will read in raw data from the input directory, clean it up to produce 
# the analytical dataset, and then write the analytical data to the output directory. 

#source in any useful functions

library(haven)
SJSD <- read_sav("analysis/input/SJSD.sav")
View(SJSD)

# subset data and omit heterosexual data

sjsd <- subset(SJSD, q18c!=8,
               select=c ("q1a","q1c","q4a","q4c","q5b","q6a","q6c","q8a","q13a",
                               "q14a","q14b","q14c","q14d","q14e","q15a","q18c","q24c","q24d"))

# recoded coming out to how many family members
sjsd$out_family <- NA
sjsd$out_family[sjsd$q14a==1] <- "None"
sjsd$out_family[sjsd$q14a==2] <- "Some"
sjsd$out_family[sjsd$q14a==3] <- "About half"
sjsd$out_family[sjsd$q14a==4] <- "Most"
sjsd$out_family[sjsd$q14a==5] <- "All"
sjsd$out_family <- factor(sjsd$out_family,
                    levels=c("None","Some","About half","Most","All"))
table(sjsd$out_family, sjsd$q14a, exclude=NULL)

# recode coming out to friends
sjsd$out_friends <- NA
sjsd$out_friends[sjsd$q14b==1] <- "None"
sjsd$out_friends[sjsd$q14b==2] <- "Some"
sjsd$out_friends[sjsd$q14b==3] <- "About half"
sjsd$out_friends[sjsd$q14b==4] <- "Most"
sjsd$out_friends[sjsd$q14b==5] <- "All"
sjsd$out_friends <- factor(sjsd$out_friends,
                          levels=c("None","Some","About half","Most","All"))
table(sjsd$out_friends, sjsd$q14b, exclude=NULL)

# recode coming out to friends
sjsd$out_neighbors <- NA
sjsd$out_neighbors[sjsd$q14e==1] <- "None"
sjsd$out_neighbors[sjsd$q14e==2] <- "Some"
sjsd$out_neighbors[sjsd$q14e==3] <- "About half"
sjsd$out_neighbors[sjsd$q14e==4] <- "Most"
sjsd$out_neighbors[sjsd$q14e==5] <- "All"
sjsd$out_neighbors <- factor(sjsd$out_neighbors,
                           levels=c("None","Some","About half","Most","All"))
table(sjsd$out_neighbors, sjsd$q14e, exclude=NULL)

# recode for participated in a LGBT event  
sjsd$event <- NA
sjsd$event[sjsd$q8a==1] <- "Never"
sjsd$event[sjsd$q8a==2] <- "Once or twice a year"
sjsd$event[sjsd$q8a==3] <- "Almost 6 times a year"
sjsd$event[sjsd$q8a==4] <- "About once a month"
sjsd$event[sjsd$q8a==5 | sjsd$q8a==6] <- "At least once a week"

sjsd$event <- factor(sjsd$event,
                     levels=c("Never","Once or twice a year","Almost 6 times a year","About once a month",
                              "At least once a week"))
table(sjsd$event, sjsd$q8a, exclude=NULL)


# recode gay marriage variable
sjsd$marriage <- NA
sjsd$marriage[sjsd$q4c==0] <- "False"
sjsd$marriage[sjsd$q4c==1] <- "True"
table(sjsd$marriage, sjsd$q4c, exclude=NULL)

# recode same sex military variable
sjsd$military <- NA
sjsd$military[sjsd$q4a==0] <- "False"
sjsd$military[sjsd$q4a==1] <- "True"
table(sjsd$military, sjsd$q4a, exclude=NULL)

# change name for family support
sjsd$fam_support <- sjsd$q15a

# change name for neighborhood homophobia
sjsd$neigh_phobia <- sjsd$q5b

# combined happiness and enjoyment into 1 variable
# minus 2 to make the data set start from 0
sjsd$happiness <- sjsd$q24c+sjsd$q24d-2

# combined bond with community and people into 1 variable
# minus 2 to make the data set start from 0
sjsd$lgbt_bond <- sjsd$q6a+sjsd$q6c-2 



sjsd <- na.omit(subset(sjsd,
                       select=c("happiness","out_family","out_friends","out_neighbors","fam_support",
                                "event","lgbt_bond","neigh_phobia","marriage","military")))

save(sjsd, file="analysis/output/analytical_data.RData")



