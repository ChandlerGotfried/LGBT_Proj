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

sjsd <- subset(SJSD, select=c ("q1a","q1c","q4a","q4c","q5b","q6a","q6c","q8a","q13a",
                               "q14a","q14b","q14c","q14d","q14e","q15a","q18c","q24c","q24d"))

# recoded coming out to how much of the family

sjsd$q14a[sjsd$q14a==1] <- "None"
sjsd$q14a[sjsd$q14a==2] <- "Some"
sjsd$q14a[sjsd$q14a==3] <- "About half"
sjsd$q14a[sjsd$q14a==4] <- "Most"
sjsd$q14a[sjsd$q14a==5] <- "All"
sjsd$q14a <- factor(sjsd$q14a,
                    levels=c("None","Some","About half","Most","All"))

# boxplot for coming out to family and support from family

boxplot(q15a~q14a, data=sjsd, na.rm=TRUE, names=c("None","Some","About half","Most","All"), 
        xlab="Coming out to family", ylab="Level of upport from family")

count <- table(sjsd$q4a)
percent <- 100*count/sum(count)
barplot(percent, main="Gay marriage support", horiz=TRUE, names.arg = c("No", "Yes"),
        xlab="Percent")

counts <- table(sjsd$q4c)
percent <- 100*counts/sum(counts)
barplot(percent, main="Support of LGBT in the military", horiz=TRUE, names.arg = c("No", "Yes"),
        xlab="Percent")

tab <- table(sjsd$q4c, sjsd$q4a)
percent <- 100*tab/sum(tab)
barplot(t(prop.table(percent,1)), beside=TRUE, names.arg=c("Same-sex military","Gay marriage"), 
        las=1, main="Support gay marriage and\nsame sex military members", ylab="Percent of reponses for support", 
        col=c("darkgreen", "yellow"), legend.text=c("No","Yes"), cex.names="0.7")


