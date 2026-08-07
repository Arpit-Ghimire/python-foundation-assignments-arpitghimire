"""
Exercise: Student Score Dictionary
Student: Arpit Ghimire
Day: 2
"""
#Input

student_scores = {
    "Arpit": 97,
    "Anjal": 55,
    "Susan": 92,
    "Neymar": 61,
    "Pranish": 48
}

#Printinhg dictionary contents
for key,val in student_scores.items():
    print(f'{key} : {val}')

# Passing students
passing_students = {
    student: score
    for student, score in student_scores.items()
    if score >= 60
}

print("\nPassing Students:")
print(passing_students)

# Highest score
top_student = max(student_scores, key=student_scores.get)

print("\nHighest Scorer:")
print(top_student, student_scores[top_student])

# Average
average = sum(student_scores.values()) / len(student_scores)

print("\nAverage Score:", average)