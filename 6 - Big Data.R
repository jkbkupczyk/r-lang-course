# -----------------------------------------
#               ¡ Big Data ¡
# -----------------------------------------


#                       Big Data Decision Table
#
# Class         Size          Rows          Storage         Management
# Small         Gigabytes     Millions      Memory          Desktop
# Medium        Terabytes     Billions      Hard Disk       R with medium data extensions
# Big           Petabytes     Trilions      Clusters        R with big data extensions
#


# Set working directory
setwd("D:\\RLangCourse")


# Load the ff lib
library(ff)

irisff <- read.table.ffdf(
  file = "iris.csv",
  FUN = "read.csv"
)

# Inspect the class
class(irisff)

# Get column names
names(irisff)

# Get the first few rows
irisff[1:5, ] # First 5 rows


# Load the biglm lib
library(biglm)

# Create a linear regression model
model <- bigglm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

# Summarize
summary(model)

# Create a scatterplot
plot(
  x = iris$Petal.Length[],
  y = iris$Petal.Width[],
  main = "Iris Petal Length vs Width",
  xlab = "Petal Length",
  ylab = "Petal Width"
)

# Get y-intercept from model
b <- summary(model)$mat[1,1]

# Get slope
m <- summary(model)$mat[2,1]

# Draw a regression line on plot
lines(
  x = iris$Petal.Length[],
  y = m * iris$Petal.Length[] + b,
  col = "red",
  lwd = 3
)

# Make prediction
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7),
    Petal.Width = c(0, 0, 0)
  )
)
