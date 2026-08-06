"""
Exercise: File Validator
Student: Arpit Ghimire
Day: 1
"""

#Input
file_name = input("Enter file name: ")

#Preprocessing
file_name = file_name.strip().lower()

#Validation and printing
if (
    file_name.endswith(".csv")
    or file_name.endswith(".json")
    or file_name.endswith(".parquet")
):
    print("Valid file format.")
else:
    print("Invalid file format.")