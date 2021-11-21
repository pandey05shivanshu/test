v1 <- c(1, 2, 3)
v2 <- c(TRUE, FALSE, TRUE)

num1 <- c(1, 2, 3, 4, 5)
num2 <- c(10:20)
length(num1)

?c()
?length()

## Data set with NA values
null_vector <- c(NA, 6, 7, 8, 9, NA, NA, 10)

length(null_vector)
?is.na
is.na(null_vector)
help(is.na)

## Ctrl+L clears the console

mylist <- list(1, "a", TRUE)
mylist2 <- list(c(1, 2, 3), c("a", "b", "c"), c(TRUE, FALSE, TRUE))
mylist3 <- list(list(1, "a", TRUE), list(2, "b", FALSE), list(3, "c", TRUE))
print(mylist2)

