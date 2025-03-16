# Load necessary library
library(ggplot2)

# Load dataset
df <- read.csv("mobiles_dataset.csv", stringsAsFactors = FALSE)

# Conversion rates to USD
conversion_rates <- list(PKR = 0.0036, INR = 0.011, CNY = 0.14, AED = 0.27)

df$Price_PKR_to_USD <- df$Launched.Price.Pakistan.PKR * conversion_rates$PKR
df$Price_INR_to_USD <- df$Launched.Price.India.INR * conversion_rates$INR
df$Price_CNY_to_USD <- df$Launched.Price.China.CNY * conversion_rates$CNY
df$Price_AED_to_USD <- df$Launched.Price.Dubai.AED * conversion_rates$AED

df$Avg_Launched_Price_USD <- rowMeans(df[, c("Price_PKR_to_USD", "Price_INR_to_USD", "Price_CNY_to_USD", "Launched.Price.USA.USD", "Price_AED_to_USD")], na.rm = TRUE)

# Calculate average price per region
region_prices <- data.frame(
  Region = c("Pakistan", "India", "China", "USA", "Dubai"),
  Avg_Price = c(
    mean(df$Price_PKR_to_USD, na.rm = TRUE),
    mean(df$Price_INR_to_USD, na.rm = TRUE),
    mean(df$Price_CNY_to_USD, na.rm = TRUE),
    mean(df$Launched.Price.USA.USD, na.rm = TRUE),
    mean(df$Price_AED_to_USD, na.rm = TRUE)
  )
)

# Plot bar chart
ggplot(region_prices, aes(x = Region, y = Avg_Price, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Smartphone Price per Region", x = "Region", y = "Average Price (USD)") +
  theme_minimal()
