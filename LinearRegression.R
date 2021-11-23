# If during Linear Regression, the correlation is closer to +1 or -1, then
# it is not good for the regression model since, it will give a huge weight 
# to the correlated items

# read data
df <- read.csv("student-mat (1).csv", sep = ";")
head(df)
summary(df)

# check for null/NA values
any(is.na(df))

# import all packages
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("dplyr")
install.packages("corrplot")

# call the packages   
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrplot)


# Extract numeric data
num.cols <- sapply(df, is.numeric)
print(num.cols)

# Drawing the correlation plot
corr.data <- cor(df[, num.cols])
print(cor(df$age, df$G3))
print(corrplot(corr.data, method = "color"))

# plot ggplot
ggplot(df, aes(x = G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = "blue") + theme_minimal()

















