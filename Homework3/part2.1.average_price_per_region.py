# Import required libraries
import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset (assuming it's in the same directory)
df = pd.read_csv("mobiles_dataset.csv")

# Currency conversion rates (because different regions = different prices)
conversion_rates = {"PKR": 0.0036, "INR": 0.011, "CNY": 0.14, "AED": 0.27}

# Convert prices to USD so everything is comparable
df["Price_PKR_to_USD"] = df["Launched.Price.Pakistan.PKR"] * conversion_rates["PKR"]
df["Price_INR_to_USD"] = df["Launched.Price.India.INR"] * conversion_rates["INR"]
df["Price_CNY_to_USD"] = df["Launched.Price.China.CNY"] * conversion_rates["CNY"]
df["Price_AED_to_USD"] = df["Launched.Price.Dubai.AED"] * conversion_rates["AED"]

# Calculate the average launched price across all regions
df["Avg_Launched_Price_USD"] = df[
    ["Price_PKR_to_USD", "Price_INR_to_USD", "Price_CNY_to_USD", "Launched.Price.USA.USD", "Price_AED_to_USD"]
].mean(axis=1)

# Get the average price per region (so we can see which region is cheapest)
region_prices = {
    "Pakistan": df["Price_PKR_to_USD"].mean(),
    "India": df["Price_INR_to_USD"].mean(),
    "China": df["Price_CNY_to_USD"].mean(),
    "USA": df["Launched.Price.USA.USD"].mean(),
    "Dubai": df["Price_AED_to_USD"].mean()
}

# Plot bar chart
plt.figure(figsize=(8, 5))
plt.bar(region_prices.keys(), region_prices.values(), color="lightblue")
plt.xlabel("Region")
plt.ylabel("Average Smartphone Price (USD)")
plt.title("Average Smartphone Price per Region")
plt.grid(axis="y")

# Show the chart
plt.show()
