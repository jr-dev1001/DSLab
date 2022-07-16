dat <- iris # load the iris dataset and renamed it dat
head(dat) # first 6 observations
str(dat) # structure of dataset
# Minimum and maximum can be found thanks to the min() and max() functions # nolint
min(dat$Sepal.Length)
max(dat$Sepal.Length)
rng <- range(dat$Sepal.Length)
rng
rng[1] # rng = name of the object specified above
rng[2]

# The range can then be easily computed, as you have guessed, by subtracting the minimum from the maximum # nolint
max(dat$Sepal.Length) - min(dat$Sepal.Length)

# function to compute the range

range2 <- function(x) {
    range <- max(x) - min(x)
    return(range)
}

range2(dat$Sepal.Length)

# mean
mean(dat$Sepal.Length)
# median
median(dat$Sepal.Length)

# to compute quantile
quantile(dat$Sepal.Length, 0.5)

quantile(dat$Sepal.Length, 0.25) # first quartile

quantile(dat$Sepal.Length, 0.75) # third quartile

# For instance, the 4th decile or the 98th percentile
quantile(dat$Sepal.Length, 0.4) # 4th decile

quantile(dat$Sepal.Length, 0.98) # 98th percentile
# The interquartile range
IQR(dat$Sepal.Length)
# Alternative method to find IQR
quantile(dat$Sepal.Length, 0.75) - quantile(dat$Sepal.Length, 0.25)

sd(dat$Sepal.Length) # standard deviation

var(dat$Sepal.Length) # variance
# to compute the standard deviation (or variance) of multiple variables at the same time, use lapply() with the appropriate statistics as second argument #nolint
lapply(dat[, 1:4], sd)

summary(dat) # summary of dataset

by(dat, dat$Species, summary) # descriptive summary we use by()

# If you need more descriptive statistics, use stat.desc() from the package {pastecs}: #nolint
# library(pastecs)
# stat.desc(dat)

# coeficcient of covariance
sd(dat$Sepal.Length) / mean(dat$Sepal.Length)

## Mode there is no function to find the mode of a variable. so we use table() and sort() #nolint
tab <- table(dat$Sepal.Length) # number of occurrences for each unique value
sort(tab, decreasing = TRUE) # sort highest to lowest

summary(dat$Species)
# table() introduced above can also be used on two qualitative variables 
# to create a contingency table. The dataset iris has only one qualitative variable #nolint
# so we create a new qualitative variable just for this example. We create the variable size which corresponds to small #nolint
# if the length of the petal is smaller than the median of all flowers, big otherwise:#nolint
dat$size <- ifelse(dat$Sepal.Length < median(dat$Sepal.Length),
    "small", "big"
)

table(dat$size)
#a contingency table of the two variables Species and size with the table() function:#nolint
table(dat$Species, dat$size)   #nolint 

xtabs(~ dat$Species + dat$size)

prop.table(table(dat$Species, dat$size))

# percentages by row:
round(prop.table(table(dat$Species, dat$size), 1), 2) # round to 2 digits with round()

mosaicplot(table(dat$Species, dat$size),
  color = TRUE,
  xlab = "Species", # label for x-axis
  ylab = "Size" # label for y-axis
)


# library(vcd)

# mosaic(~ Species + size,
#   data = dat,
#   direction = c("v", "h")
# )


barplot(table(dat$size)) # table() is mandatory

barplot(prop.table(table(dat$size)))

hist(dat$Sepal.Length)


boxplot(dat$Sepal.Length)

boxplot(dat$Sepal.Length ~ dat$Species)

plot(dat$Sepal.Length, dat$Petal.Length)

plot(dat$Sepal.Length,
  type = "l"
) # "l" for line

# Draw points on the qq-plot:
qqnorm(dat$Sepal.Length)
# Draw the reference line:
qqline(dat$Sepal.Length)

# qqPlot(dat$Sepal.Length, groups = dat$size)

plot(density(dat$Sepal.Length))

# ctable(
#   x = dat$Species,
#   y = dat$size
# )



# ctable(
#   x = dat$Species,
#   y = dat$size,
#   prop = "t" # total proportions
# )

# ctable(
#   x = dat$Species,
#   y = dat$size,
#   prop = "n", # remove proportions
#   totals = FALSE, # remove totals
#   headings = FALSE # remove headings
# )



# ctable(
#   x = dat$Species,
#   y = dat$size,
#   chisq = TRUE, # display results of Chi-square test of independence
#   headings = FALSE # remove headings
# )

# descr(dat,
#   headings = FALSE, # remove headings
#   stats = "common" # most common descriptive statistics
# )