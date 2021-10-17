# -----------------------------------------
#           ¡ Machine Learning ¡
# -----------------------------------------

data(iris)


# Set a seed to make randomness reproducable
set.seed(42)


indexes <- sample(
  x = 1:150,
  size = 100
)

print(indexes)

# Create a training set from indexes
trainSet <- iris[indexes, ]


# Create a test set from remaining indexes
testSet <- iris[-indexes, ]

# Load the decision tree package
library(tree)


# Train a decision tree mdoel
model <- tree::tree(
  formula = Species ~ ., # . == all
  data = testSet
)

summary(model)

# Visualize the decision tree model
plot(model)
text(model)

library(RColorBrewer)

# Create a color palette
palette <- brewer.pal(3, "Set2")


# Create a scatterplot colored by species
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)],
  main = "Iris Petal Length vs Width",
  xlab = "Petal Length",
  ylab = "Petal Width"
)

# Plot the decision boundaries
tree::partition.tree(
  tree = model,
  label = "Species",
  add = TRUE
)


# Predict with the model
predictions <- predict(
  object = model,
  newdata = testSet,
  type = "class"
)

# Create a confusion matrix
# Machine learning accuracy
table(
  x = predictions,
  y = testSet$Species
)


if ("caret" %in% rownames(installed.packages()) == FALSE) {
  install.packages("caret")
}

# Load caret package
library(caret)

confusionMatrix(
  data = predictions,
  reference = testSet$Species
)

# Save the tree model
save(model, file = "Tree.RData")
