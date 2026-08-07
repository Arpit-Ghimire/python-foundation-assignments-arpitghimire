"""
Exercise: Clean Numeric Values
Student: Arpit Ghimire
Day: 2
"""

#Input values
raw_values = [100, None, 250, "invalid", 300, None, 450]
clean_values = []

#checking data type and adding integer values to new list
for val in raw_values:
    if isinstance(val,int):
        clean_values.append(val)

print(clean_values)

#Using List Comprehension

clean_values = [val for val in raw_values if isinstance(val, int)]
print(clean_values)