x <- c(1:10, 1:5, NA)
length (x)
max (x, na.rm = T)
min(x, na.rm = T)

# give the summary report of x
summary(x)
table(x)
mean(x, na.rm = T)
gss <- read.csv("/Users/libraries/Downloads/R Introduction workshop/GSSsubset.csv")
head(gss)
dim(gss)
nrow(gss)
ncol(gss)
colnames(gss)
gss[1,]
gss[1,3]
gss$age
which(gss$income > 150000)
gss[which(gss$income > 150000), ]
gss[which(gss$degree == "GRADUATE"), ]
colnames(gss)[2] <- "gender"

gss[order(gss$income), ]

gss.sorted <- gss[order(gss$income), ]
View(gss.sorted)
?order()

gss[order(gss$income, gss$age), ]

gss[order(gss$age, gss$income ), ]

colnames(gss)[2] <- "gender"

isbn <- read.csv("/Users/libraries/Downloads/R Introduction workshop/ISBN.csv")
View(isbn)

colnames(isbn)[8] <- "request_month"
isbn[order(isbn$ISSN, isbn$year), ]
which(colnames(isbn) == "request_month")
colnames(isbn)[8] <- "requested_month"
isbn[order(isbn$ISSN, isbn$year), ]
isbn[which(isbn$journal_title == "Journal of Crystal Growth"), ]
isbn[which(isbn$journal_title == "Journal of Crystal Growth"), 4]
unique(isbn[which(isbn$journal_title == "Journal of Crystal Growth"), 4])


summary(gss)

aggregate(gss$income, by= list(gss$gender), mean)
aggregate(gss$income, by= list(gss$gender), sum)

lib <- read.csv("/Users/libraries/Downloads/R Introduction workshop/lib_checkout.csv")
View(lib)
aggregate(lib$book_checkout, by= list(lib$status), sum)[2, ]

aggregate(lib$book_checkout, by= list(lib$status), sum)[1, ]

aggregate(lib$book_checkout, by= list(lib$day), mean)

weekmean <- aggregate(lib$book_checkout, by= list(lib$status, lib$day), mean)
weekmean


#plot

hist(gss$income)

hist(gss$income, xlab = 'Income', ylab = "Count", main = "Histogram of ...")

plot(gss$hrswrk, gss$income,
     xlab = "hrs working",
     ylab = "Income", 
     main = "scatter plot")


##exercise 3

lib2 <- lib[which(lib$status == "Undergrad"), ]
View (lib2)
plot(lib2$laptop_checkout, 
     lib2$book_checkout, 
     xlab = "laptop checkout", 
     ylab = "book checkout", 
     main = "lap vs book")

## continue

lm(income ~ hrswrk, data = gss)

mod <- lm(income ~ hrswrk, data = gss)

summary(mod)

# exercise 3
lm(book_checkout ~ laptop_checkout, data = lib2)
libmod <- lm(book_checkout ~ laptop_checkout, data = lib2)
summary(libmod)
