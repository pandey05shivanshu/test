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
# install.packages("ggplot2")
# install.packages("ggthemes")
# install.packages("dplyr")
# install.packages("corrplot")

# call the packages   
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrplot)


# Extract numeric data
num.cols <- sapply(df, is.numeric)
print(num.cols)

# NOTE: sapply(), lapply(), tapply() are derived from apply()

# Drawing the correlation plot
corr.data <- cor(df[, num.cols])
print(cor(df$age, df$G3))
print(corrplot(corr.data, method = "color"))

# PLOT GGPLOTS

# histogram
ggplot(df, aes(x = G3)) + geom_histogram(bins = 20, alpha = 0.5, fill = "blue") + theme_minimal()

# box plot
ggplot(df, aes(x = sex, y = G3)) + geom_boxplot(alpha = 0.5, fill = "green") + theme_minimal()

# bar graph   
ggplot(df, aes(x = Fjob)) + geom_bar(alpha = 0.3, fill = "red") + theme_minimal()


# Import remaining libraries
# install.packages("caTools")
library(caTools)

set.seed(101)

# Split the data into train and test
sample <- sample.split(df$G3, SplitRatio=0.70)
train <- subset(df, sample == TRUE) 
test <- subset(df, sample == FALSE)

# model <- lm(y ~ X1 + X2 + ...)

# BASE MODEL
model <- lm(G3 ~ . , data = train )

## Plot Residuals of the model

res <- residuals(model)
res <- as.data.frame(res)

ggplot(res, aes(res)) + geom_histogram(bins = 20, alpha = 0.5, fill = "blue") + theme_minimal()


print(summary(model))


# ASSUMPTIONS OF LINEAR REGRESSION:
#   1. The independent variables should not be correlated
#   2. The error term (predicted - actual) must have constant variance. - (homoskedasticity )
#   3. Error term must be normally distributed - Error terms plotted must look like a normal distribution
#   4. Autocorrelation: the presence of correlation in error terms which drastically reduce model's accuracy

# AIC vs BIC


## TESTING

G3.predict <- predict(model, test)
results <- cbind(G3.predict, test$G3)
colnames(results) <- c('pred', 'real')
results <- as.data.frame(results)
print(results)

#user defined function to remove negative predictions
to_zero <- function(x){
  return(max(x, 0))
}

results$pred <- sapply(results$pred, to_zero)
print(results)

# Check Accuracy

mse <- mean((results$real - results$pred)^2)
print(mse)
rmse <- mse^0.5
print(rmse)

SSE <- sum((results$pred - results$real)^2)
SST <- sum((mean(df$G3) - results$real)^2)

R2 <- 1 - SSE / SST
print(R2)






































