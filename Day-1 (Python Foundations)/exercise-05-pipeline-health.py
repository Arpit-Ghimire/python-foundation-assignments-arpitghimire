"""
Exercise: Pipeline Health Status
Student: Arpit Ghimire
Day: 1
"""

#Loading data of pipeline
rows_loaded = 9800
rows_failed = 200
runtime_minutes = 18

#Calculation of defects
total_rows = rows_loaded + rows_failed
failure_rate = (rows_failed / total_rows) * 100

#if else ladder
if failure_rate <= 2 and runtime_minutes <= 20:
    status = "Healthy"
elif failure_rate <= 5:
    status = "Warning"
else:
    status = "Critical"

#Output
print(f"Failure Rate: {failure_rate:.2f}%")
print(f"Pipeline Status: {status}")