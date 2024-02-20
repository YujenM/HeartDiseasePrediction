# Heart Disease Prediction and Model Evaluation

## Overview
This R script performs heart disease prediction using logistic regression and decision tree models. The dataset "heart.csv" is utilized for training and evaluating the models. The script includes data exploration, handling missing values, model building, evaluation, and hyperparameter tuning.

## Dependencies
Ensure you have the necessary R libraries installed before running the script. You can install them using the following commands:

```R
install.packages(c("tidyverse", "caret", "ranger", "ROCR"))
```

# Heart Disease Prediction and Model Evaluation

## Overview
This R script performs heart disease prediction using logistic regression and decision tree models. The dataset "heart.csv" is utilized for training and evaluating the models. The script includes data exploration, handling missing values, model building, evaluation, and hyperparameter tuning.

## Dependencies
Ensure you have the necessary R libraries installed before running the script. You can install them using the following commands:

```R
install.packages(c("tidyverse", "caret", "ranger", "ROCR"))
```

# Heart Disease Prediction and Model Evaluation

## Summary
This R script facilitates heart disease prediction and model evaluation using logistic regression and decision tree models. Utilizing the "heart.csv" dataset, the script covers key steps, including data exploration, handling missing values, model building, and evaluation.

## Usage
1. **Load Libraries:** Use `library()` commands to load necessary R libraries.
2. **Read Dataset:** Employ `read_csv` to read the "heart.csv" dataset.
3. **Explore Dataset:** Understand dataset structure and statistics with `summary()`.
4. **Handle Missing Values:** Remove rows with missing values using `na.omit()`.
5. **Split Data:** Divide data into training and testing sets using `createDataPartition`.
6. **Build Logistic Regression Model:** Create a logistic regression model with `glm`.
7. **Make Predictions and Evaluate Model:** Predict on the test set and assess model performance.
8. **Visualize Target Distribution:** Use a barplot to visualize the target variable distribution.
9. **Generate Heatmap for Correlation Matrix:** Create a heatmap for feature correlation.
10. **Build Decision Tree Model:** Utilize the `ranger` package to build and evaluate a decision tree model.
11. **Perform Cross-Validation:** Employ cross-validation for hyperparameter tuning using `train`.
12. **Use Best Hyperparameters:** Build the final logistic regression model with the best hyperparameters.
13. **Make Final Predictions and Evaluate Model:** Assess the final model's performance on the test set.

## Results
The script provides accuracy metrics, confusion matrices, and visualizations for logistic regression and decision tree models. Cross-validation aids in hyperparameter tuning, enhancing the final logistic regression model.

## Conclusion
This script serves as a comprehensive guide for heart disease prediction and model evaluation. Users can understand the dataset, implement logistic regression and decision tree models, and assess model performance using various metrics.
