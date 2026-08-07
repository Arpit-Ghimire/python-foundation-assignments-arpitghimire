"""
Exercise: Sales List Analysis
Student: Arpit Ghimire
Day: 2
"""

#Sales Data
monthly_sales = [85000, 120000, 95000, 140000, 75000, 160000]

# Highest to lowest
sorted_sales = sorted(monthly_sales, reverse=True)

# Above 100000
high_sales = [sale for sale in monthly_sales if sale > 100000]

# Add 13% tax
sales_with_tax = [sale * 1.13 for sale in monthly_sales]

# Total
total_sales = sum(monthly_sales)

# Average
average_sales = total_sales / len(monthly_sales)

#Prints
print("Sorted:", sorted_sales)
print("Above 100000:", high_sales)
print("With Tax:", sales_with_tax)
print("Total:", total_sales)
print("Average:", average_sales)