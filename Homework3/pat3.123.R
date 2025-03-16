# Load necessary libraries
library(ggplot2)

# Load dataset
df <- read.csv("mobiles_dataset.csv", stringsAsFactors = FALSE)

# Part 1: Price Distribution by Company in USA
# Create boxplot for price distribution in USA
ggplot(df, aes(x = Company.Name, y = Launched.Price.USA.USD, fill = Company.Name)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.6) +  # Boxplot without outlier shapes
  geom_jitter(width = 0.2, alpha = 0.6, size = 1) +  # Overlay individual data points
  labs(title = "Price Distribution by Company in USA", 
       subtitle = "A boxplot showing how the price varies by company, with individual data points overlaid",
       x = "Company", 
       y = "Price in USD") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "right")

# Part 2: Battery Capacity vs. Price in USA
# Scatter plot for battery capacity vs price in USA
ggplot(df, aes(x = Battery.Capacity.mAh, y = Launched.Price.USA.USD, color = Company.Name)) +
  geom_point(alpha = 0.6, size = 3) +
  labs(title = "Battery Capacity vs. Price in USA", 
       subtitle = "The relationship between battery capacity, price, and screen size across different smartphone brands",
       x = "Battery Capacity", 
       y = "Price") +
  theme_minimal()

# Part 3: Battery Capacity vs. Price for Top 5 Brands
# Filtering top 5 brands based on frequency
top_brands <- names(sort(table(df$Company.Name), decreasing = TRUE)[1:5])
df_top <- df[df$Company.Name %in% top_brands, ]

# Scatter plot with different shapes for each brand
ggplot(df_top, aes(x = Battery.Capacity.mAh, y = Launched.Price.USA.USD, shape = Company.Name, color = Screen.Size.inches)) +
  geom_point(alpha = 0.7, size = 3) +
  labs(title = "Battery Capacity vs. Price for Top 5 Brands", 
       subtitle = "Different Shapes for Each Brand, Color by Screen Size, (USA)",
       x = "Battery Capacity (mAh)", 
       y = "Price (USD)") +
  theme_minimal() +
  theme(legend.position = "right")
