# -----------------------------------------
#           ¡ Working with data ¡
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

# Load dplyr library
library(dplyr)

# Select a subset of columns
temp <- dplyr::select(
  .data = file,
  Transmission,
  Cylinders,
  Fuel.Economy
)

head(temp)


# Get All that have transmission set to "Automatic"
temp <- dplyr::filter(
  .data = temp,
  Transmission == "Automatic"
)

head(temp)


# Compute a new column
temp <- dplyr::mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)

head(temp)


# Group by column
temp <- dplyr::group_by(
  .data = temp,
  Cylinders
)

head(temp)


# Aggregate based on groups ^
temp <- dplyr::summarise(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)

head(temp)


# Arrange the rows in descending order
temp <- dplyr::arrange(
  .date = temp,
  dplyr::desc(Avg.Consumption)
)

head(temp)


# Convert tibble to data frame 
efficiency <- as.data.frame(temp)

print(efficiency)


# Chain method together (PIPING)
efficiency <- file %>% 
  dplyr::select(Fuel.Economy, Cylinders, Transmission) %>%
  dplyr::filter(Transmission == "Automatic") %>%
  dplyr::mutate(Consumption = Fuel.Economy * 0.425) %>%
  dplyr::group_by(Cylinders) %>%
  dplyr::summarise(Avg.Consumption = mean(Consumption)) %>%
  dplyr::arrange(dplyr::desc(Avg.Consumption)) %>%
  as.data.frame()

print(efficiency)


# Save the result to a CSV
write.csv(
  x = efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE
)
