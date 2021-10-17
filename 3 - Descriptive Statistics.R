# -----------------------------------------
#         ¡ Descriptive Statisics ¡
# -----------------------------------------


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

# Name Transmission Cylinders Fuel.Economy
# 1         Mazda RX4       Manual         6         21.0
# 2         Mazda RX4       Manual         6         21.0
# 3        Datsun 710    Automatic         4         22.8
# 4    Hornet 4 Drive    Automatic         6         21.4
# 5 Hornet Sportabout    Automatic         8         18.7
# 6         Merc 240D    Automatic         6         18.1

# Create a frequency table
table(file$Transmission)

file$Cylinders


# Get the minimum value
min(file$Cylinders) # 4

# Get the maximum value
max(file$Cylinders) # 8

# Get the average (mean)
mean(file$Cylinders)

# Get the median
median(file$Fuel.Economy)

# Get the quantile
# *1stQ --> first quantile
# Min     1stQ   median    2ndQ     max 
# 0%      25%     50%     75%     100% 
# 10.40   15.00   17.95   21.10   22.80 
quantile(file$Fuel.Economy)


# Get the standard deviation
sd(file$Fuel.Economy)


# Get the total
sum(file$Fuel.Economy)


# Get the correlation coefficient
cor(
  x = file$Cylinders,
  y = file$Fuel.Economy
)

# Summarize an entire table
summary(file)
