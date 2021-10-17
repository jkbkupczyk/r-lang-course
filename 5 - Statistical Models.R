# -----------------------------------------
#         ¡ Statistical Model ¡
# -----------------------------------------


# Load data
data("iris")

head(iris)


plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  main = "Iris Petal Length vs Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)


# Create a linear regression model
model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

# Summary
summary(model)


# Draw a regression line model
lines(
  x = iris$Petal.Length,
  y = model$fitted,
  col = "red",
  lwd = 3
)


# Get correlation coefficient
cor(
  x = iris$Petal.Length,
  y = iris$Petal.Width
)


# Predict new values from the model
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7)
  )
)
