# Import required libraries
import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv("mobiles_dataset.csv")

# Count how many models each brand has (to see market share)
brand_counts = df["Company.Name"].value_counts()

# Plot pie chart (aka who’s dominating the market)
plt.figure(figsize=(8, 8))
plt.pie(brand_counts, labels=brand_counts.index, autopct="%1.1f%%", startangle=140)
plt.title("Smartphone Brand Market Share")
plt.axis("equal")  # Make sure the pie chart is actually round

# Show the chart
plt.show()
