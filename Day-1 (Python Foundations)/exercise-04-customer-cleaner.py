"""
Exercise: Customer Details Cleaning
Student: Arpit Ghimire
Day: 1
"""
#Inputs
raw_name = "  aRPiT GHIMIRE "
raw_city = "kATHMANDU "
raw_age = "19"
raw_email = " aRPITghi9@GMAIL.COM "

#Applying String Methods for cleaning
name = raw_name.strip().title()
city = raw_city.strip().title()
age = int(raw_age.strip())
email = raw_email.strip().lower()

#Checking the status of age
status = "Adult" if age >= 18 else "Minor"

#Output using f string
print(f"Name: {name}")
print(f"City: {city}")
print(f"Age: {age}")
print(f"Email: {email}")
print(f"Status: {status}")