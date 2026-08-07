"""
Exercise: Batch Processor
Student: Arpit Ghimire
Day: 2
"""

#Loop for printing batch number
for batch_number in range(1,11):
    print(f'Processing batch {batch_number}')
    if(batch_number % 3 == 0): #if condition for checking the checkpoint
        print('Checkpoint reached'+ '\n')