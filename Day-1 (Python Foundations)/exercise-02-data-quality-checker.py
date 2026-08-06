"""
Exercise: Data Quality Checker
Student: Arpit Ghimire
Day: 1
"""

#Input rows
total_rows = 2000
missing_rows = 120
duplicate_rows = 30

#Calculations
problematic_rows = missing_rows + duplicate_rows
problem_percentage = (problematic_rows / total_rows) * 100

#Conditional Statements
if problem_percentage <= 2:
    classification = "Excellent"
elif problem_percentage <= 5:
    classification = "Acceptable"
else:
    classification = "Needs Cleaning"

#Display
print(f"Total rows: {total_rows}")
print(f"Problematic rows: {problematic_rows}")
print(f"Problem percentage: {problem_percentage:.2f}%")
print(f"Classification: {classification}")