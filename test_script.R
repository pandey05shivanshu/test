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

##Matrix

mat1 <- matrix(data = c(1, 2, 3, 4), nrow = 2, byrow = T)
mat2 <- matrix(data = c("a", "b", "c"), nrow = 1, byrow = TRUE)

mean(mat1[2,])
mean(mat1[,2])

##FACTORS

my_data <- c("Male", "Female", "Male", "Female")
as.factor(my_data)
class(my_data)
print(my_data)

vector_status <- c("Poor", "Poor", "Imporved", "Excelent", "Excellent", "Poor")
vector_status1 <- factor(vector_status, ordered=TRUE, levels = c("Poor", "Improved", "Excellent"))
print(vector_status1)


##DATA FRAME

df <- data.frame(Name = c("Ram", "Shyam"), Age = c(32, 45))
print(df)
age <- df$Age
age
