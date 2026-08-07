"""
Exercise: Dataset Comparison
Student: Arpit Ghimire
Day: 2
"""
#Input Datasets
dataset_a = {
    "customer",
    "sales",
    "product",
    "employee"
}

dataset_b = {
    "sales",
    "product",
    "supplier",
    "inventory"
}

#Required
'''
All unique dataset names
Datasets found in both groups
Datasets only in dataset_a
Datasets only in dataset_b
'''

#Calculations for required conditions
all_datasets = dataset_a | dataset_b # or you can use all_datasets = dataset_a.union(dataset_b)
common = dataset_a & dataset_b # or you can use all_datasets = dataset_a.intersection(dataset_b)
only_a = dataset_a - dataset_b
only_b = dataset_b - dataset_a

#Prints
print("All datasets:", all_datasets)
print("Common datasets:", common)
print("Only in dataset A:", only_a)
print("Only in dataset B:", only_b)