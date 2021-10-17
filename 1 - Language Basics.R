# -----------------------------------------
#               ¡ R BASICS ¡
# -----------------------------------------


# Assignment operators
x <- "Hello World!"
y = "Hello World!"
"Hello World!" -> z

# Types
boo <- TRUE # bool - true or false
lon <- 123L # long - long int
num <- 1.23 # decimal
str <- "ABC 123" # string
dat <- as.Date("2001-02-03") # date ISO 8601

# Create function
mul <- function(x, y) { x * y } # multiplies x and y
value <- mul(5, 3) # 15


# -----------------------------------------
#       ¡ Complex data structures ¡
# -----------------------------------------


vec <- c(1, 2, 3) # vector containing specified data (only one type)
vec

# Create sequence
seqASC <- 1:10 # create ascending sequence --> [1,2,3,4,5,6,7,8,9]
seqDESC <- 5:1 # create descending sequence --> [5,4,3,2,1]

# Create matrix
mat <- matrix(data = 1:9, nrow = 3, ncol = 3)
mat

# Create an array 
arr <- array(data = 1:8, dim = c(2, 2, 2))
arr

# Create a list (vector with any type of data - can be mixed)
lis <- list(TRUE, 123L, 2.34, "ABC")
lis

# Create a factor
categories <- c("Male", "Female", "Male", "Male", "Male") # each value have its own key --> Male: 2, Female: 1
factor <- factor(categories)
factor # prints: "Female" and "Male

levels(factor)
unclass(factor)

# Creating a data frame
df <- data.frame(
  Name = c("Cat", "Dog", "Cow", "Pig"),
  Number = c(5, 10, 15, 20),
  IsPet = c(TRUE, TRUE, FALSE, FALSE)
)
df

# Indexing data frames by row and column
df[1, 2] # get value of row 1 and column 2

# Indexing data frames by row
df[1, ] # get value of row 1 across all columns - Get First Row

# Indexing data frames by column
df[,1] # get value column 1 across all rows - Get First Column

# Indexing data frames by names 
df[["Number"]] # get data by column name
df$Number # get data by column name

# Subsetting data frames
df[c(2, 4), ] # get data frame rows 2 and 4
df[2:4, ] # get data frame rows 2 to 4 - 2, 3, 4
df[c(TRUE, FALSE, TRUE, FALSE), ] # specify which rows to select - get 1st, omit 2nd, get 3rd, omit 4th
df[df$IsPet == TRUE, ] # get animals that are pets
df[df$Number > 10, ] # get animals with number greater than 10
df[df$Name %in% c("Cat", "Cow"), ] # get all animals that have "Cat" or "Cow" in name


# -----------------------------------------
#               ¡ Others ¡
# -----------------------------------------


# R is a vectorized language!!!
# All types are vectors e.g. number 1 is vector of size 1 and number 2 as well, thus sum of 1 and 2 is sum of vectors
1 + 2 # 3
c(1, 2, 3) + c(2, 4, 6) # gets us vector --> 3, 6, 9 since 1 + 2 = 3, 2 + 4 = 6, 3 + 6 = 9


# Named vs. ordered arguments
# in R you can pass arguments in function as named parameters (data = 1:6, nrow = 2, ncol = 3)
# or ordered arguments (1:6, 2, 3)
# to know which argument is first use ? with function name ¡
# ?FUNCTION_NAME e.g ?matrix --> get info about matrix function
?matrix
m1 <- matrix(data = 1:6, nrow = 2, ncol = 3)
m2 <- matrix(1:6, 2, 3)
m1 == m2 # check if elements of this matrix are the same --> returns vector
identical(m1, m2) # check if elements of this matrix are the same --> returns only TRUE/FALSE

# Installing packages
install.packages("dplyr")

# Loading packages
library("dplyr")

# Viewing help --> Get online documentation
?data.frame
