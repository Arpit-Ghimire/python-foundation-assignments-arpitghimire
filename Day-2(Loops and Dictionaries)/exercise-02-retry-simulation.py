"""
Exercise: Retry Simulation
Student: Arpit Ghimire
Day: 2
"""

#Inputs
attempt = 1
max_attempts = 3
operation_successful = False

#Whilw loop to check operation status after each attempts
while attempt <= max_attempts:
    print(f'Attempt {attempt}')

    if(attempt == 2):
        operation_successful = True
        break

    attempt += 1

#Output
if operation_successful:
    print('Operation Completed Successfully.')

else:
    print('Operation Failed after 3 attempts.')