setwd("THE FOLDER PATH")

## ----------------------
## Exercise 1: ISBN
## ----------------------

ISBN <- read.csv("ISBN.csv")

# rename 
which(colnames(ISBN) == "month")         ## Returns the column index of the name "month", if you do not wish to count
colnames(ISBN)[8] <- "Requested_month"

# Sort
ISBN[order(ISBN$ISSN, ISBN$year), ]

# Journal request year
ISBN[which(ISBN$journal_title == "Journal of Crystal Growth"), ]$year


## -------------------------
## Exercise 2: lib_checkout
## -------------------------

libdata <- read.csv("lib_checkout.csv")
aggregate(libdata$book_checkout, by = list(libdata$status), sum)

#|     Group.1     x
#| 1      Grad 30927
#| 2 Undergrad 51541

aggregate(libdata$book_checkout, by = list(libdata$day), mean)

#|     Group.1        x
#| 1    Friday 1338.625
#| 2    Monday 1645.700
#| 3  Saturday 1004.625
#| 4    Sunday 1162.250
#| 5  Thursday 1414.625
#| 6   Tuesday 1409.400
#| 7 Wednesday 1569.500

weekmean <- aggregate(libdata$book_checkout, by = list(libdata$day, libdata$status), mean)
weekmean

#|      Group.1   Group.2       x
#| 1     Friday      Grad 1004.00
#| 2     Monday      Grad 1234.40
#| 3   Saturday      Grad  753.50
#| 4     Sunday      Grad  871.75
#| 5   Thursday      Grad 1061.00
#| 6    Tuesday      Grad 1057.00
#| 7  Wednesday      Grad 1177.25
#| 8     Friday Undergrad 1673.25
#| 9     Monday Undergrad 2057.00
#| 10  Saturday Undergrad 1255.75
#| 11    Sunday Undergrad 1452.75
#| 12  Thursday Undergrad 1768.25
#| 13   Tuesday Undergrad 1761.80
#| 14 Wednesday Undergrad 1961.75

## -----------------------------
## Exercise 3: lib_checkout plot
## -----------------------------
weekmean$Group.1 <- factor(weekmean$Group.1, levels(weekmean$Group.1)[c(2, 6, 7, 5, 1, 3, 4)])

ggplot(weekmean, aes(x=Group.1, y= x, fill = Group.2)) + 
  geom_bar(position = "dodge", stat="identity")+
  labs( title = "Histogram of Weekly Checkout",
        subtitle = "by Student status and Week Day",
        caption = "Based on data from Lib checkout",
        x = "Week day",
        y = "Average checkout",
        fill = "Student status")

