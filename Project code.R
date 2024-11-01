data(mtcars)
summary(mtcars)
str(mtcars)

#Set seed for reproducibility
set.seed(123)
train_data <- mtcars[train_index,]
test_data <- mtcars[-train_index,]

# Linear regression model
linear_model <- lm(mpg ~ wt + hp, data = train_data)
summary(linear_model)

# Polynomial regression with second-order terms
poly_model <- lm(mpg ~ wt + I(wt^2) + hp + I(hp^2), data = train_data)
summary(poly_model)

# Predictions
linear_pred <- predict(linear_model, newdata = test_data)
poly_pred <- predict(poly_model, newdata = test_data)

# Calculate MSE for each model
linear_mse <- mean((test_data$mpg - linear_pred)^2)
poly_mse <- mean((test_data$mpg - poly_pred)^2)

# R-squared for each model
linear_r2 <- summary(linear_model)$r.squared
poly_r2 <- summary(poly_model)$r.squared

cat("Linear Model MSE:", linear_mse, "\nPolynomial Model MSE:", poly_mse)
cat("Linear Model R-squared:", linear_r2, "\nPolynomial Model R-squared:", poly_r2)
