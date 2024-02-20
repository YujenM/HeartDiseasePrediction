# Install necessary libraries

# Load necessary libraries
library(tidyverse)
library(caret)
library(ranger)
library(ROCR)

# Read the dataset
heart_disease_data <- read_csv("heart.csv")

# Explore the dataset
summary(heart_disease_data)

# Handle missing values
heart_disease_data <- heart_disease_data %>%
  na.omit()

# Split the data into training and testing sets
set.seed(123)
train_indices <- createDataPartition(heart_disease_data$target, p = 0.7, list = FALSE)

# Create training and testing sets
train_set <- heart_disease_data[train_indices, ]
test_set <- heart_disease_data[-train_indices, ]

# Build a logistic regression model
logistic_model <- glm(target ~ ., data = train_set, family = "binomial")

# Make predictions on the test set
predictions <- predict(logistic_model, newdata = test_set, type = "response")

# Convert probabilities to binary predictions
binary_predictions <- ifelse(predictions > 0.5, 1, 0)

# Evaluate the model performance (calculate accuracy)
accuracy <- mean(binary_predictions == test_set$target)
print(paste("Accuracy:", accuracy))

# Confusion Matrix
conf_matrix <- confusionMatrix(table(binary_predictions, test_set$target))
print("Confusion Matrix:")
print(conf_matrix)

# Barplot for Target distribution
ggplot(heart_disease_data, aes(x = as.factor(target), fill = as.factor(target))) +
  geom_bar() +
  labs(title = "Distribution of Target Variable", x = "Target", y = "Count") +
  theme_minimal()

# Heatmap for Correlation Matrix
cor_matrix <- cor(heart_disease_data %>% select(-target))
heatmap(cor_matrix, 
        col = colorRampPalette(c("blue", "white", "red"))(50),
        main = "Correlation Heatmap")

# Decision Tree model
# Use ranger for decision tree
tree_model <- ranger(target ~ ., data = train_set)

# Make predictions on the test set
tree_predictions <- predict(tree_model, data = test_set)$predictions

# Convert probabilities to binary predictions
tree_binary_predictions <- ifelse(tree_predictions > 0.5, 1, 0)

# Evaluate the decision tree model performance (calculate accuracy)
tree_accuracy <- mean(tree_binary_predictions == test_set$target)
print(paste("Decision Tree Accuracy:", tree_accuracy))

# Cross-validation for hyperparameter tuning
set.seed(123)
cv_model <- train(
  target ~ .,
  data = train_set,
  method = "glm",
  family = "binomial",
  trControl = trainControl(method = "cv", number = 5, verboseIter = TRUE)
)

# Print cross-validated results
print(cv_model)

# Use the best hyperparameters to build the final model
final_logistic_model <- glm(target ~ ., data = train_set, family = "binomial", 
                            weights = ifelse(train_set$target == 1, 2, 1))

# Make final predictions on the test set
final_predictions <- predict(final_logistic_model, newdata = test_set, type = "response")

# Convert probabilities to binary predictions
final_binary_predictions <- ifelse(final_predictions > 0.5, 1, 0)

# Evaluate the final model performance (calculate accuracy)
final_accuracy <- mean(final_binary_predictions == test_set$target)
print(paste("Final Logistic Regression Accuracy:", final_accuracy))

