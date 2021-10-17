# -----------------------------------------
#         ¡ Data Visualizations ¡
# -----------------------------------------


# Load the gglplot2 lib
library(ggplot2)

# Set working directory
setwd("D:\\RLangCourse")

# Read a tab-delimeted data file
file <- read.table(
  file = "Cars.txt", # File name
  header = TRUE, # Include Headers?
  sep = "\t",
  quote = "\""
)

# Peek at the data
head(file)


# Create a frequency bar chart
ggplot(
  data = file,
  aes(x = Transmission)) +
    geom_bar() +
    ggtitle("Count of Cars by Transmission Type") +
    xlab("Transmission Type") +
    ylab("Count of Cars")



# Create a histogram
ggplot(
  data = file,
  aes(x = Fuel.Economy)) +
    geom_histogram(bins = 10) + 
    ggtitle("Distribution of Fuel Economy") + 
    xlab("Fuel Economy (mpg)") + 
    ylab("Count of Cars")



# Create a histogram
ggplot(
  data = file,
  aes(x = Fuel.Economy)) +
  geom_density(bins = 10) + 
  ggtitle("Distribution of Fuel Economy") + 
  xlab("Fuel Economy (mpg)") + 
  ylab("Density")



# Create a scatterplot
ggplot(
  data = file,
  aes(
    x = Cylinders,
    y = Fuel.Economy)) +
  geom_point() + 
  ggtitle("Fuel Economy by Cylinders") + 
  xlab("Number of Cylinders") + 
  ylab("Fuel Economy (mpg)")
