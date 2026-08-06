"""
Exercise: Stretch Excersice (Access validator)
Student: Arpit Ghimire
Day: 1
"""

#List of roles and datasets
allowed_roles = ["analyst", "scientist", "engineer"]
restricted_datasets = ["salary_data", "personal_data"]

#UDF for checking access
def check_access(user_role, is_active, requested_dataset):

    #if else conditions check
    if not is_active:
        print("Access denied because the user is inactive.")
    elif user_role not in allowed_roles:
        print("Access denied because the role is not allowed.")
    elif requested_dataset in restricted_datasets:
        print("Access denied because the dataset is restricted.")
    else:
        print("Access granted.")


#Function calling 
# Scenario 1
check_access("analyst", True, "sales_data")

# Scenario 2
check_access("manager", True, "sales_data")

# Scenario 3
check_access("scientist", False, "sales_data")

# Scenario 4
check_access("engineer", True, "salary_data")