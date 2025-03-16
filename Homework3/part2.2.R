# Load necessary library
library(ggplot2)

# Load dataset
df <- read.csv("mobiles_dataset.csv", stringsAsFactors = FALSE)

# Calculate brand market share
brand_counts <- as.data.frame(table(df$Company.Name))
colnames(brand_counts) <- c("Brand", "Count")

# Plot pie chart
ggplot(brand_counts, aes(x = "", y = Count, fill = Brand)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Smartphone Brand Market Share") +
  theme_minimal() +
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(), panel.grid = element_blank())
