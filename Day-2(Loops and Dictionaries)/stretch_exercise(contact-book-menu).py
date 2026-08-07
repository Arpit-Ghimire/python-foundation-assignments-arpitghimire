"""
Exercise: Stretch Exercise(Contact Book Menu)
Student: Arpit Ghimire
Day: 2
"""

#UDF for adding contacts
def add_contact(contacts):
    name = input("Enter Name: ")
    phone = input("Enter Phone Number: ")
    email = input("Enter Email: ")

    contacts[name] = {
        "phone": phone,
        "email": email
    }

    print("Contact added successfully!")

#UDF for searching contacts and printing that contact details
def search_contact(contacts):
    name = input("Enter Name to Search: ")

    if name in contacts:
        print("\nContact Found")
        print("Name :", name)
        print("Phone:", contacts[name]["phone"])
        print("Email:", contacts[name]["email"])
    else:
        print("Contact not found.")


#UDF for deleting contacts
def delete_contact(contacts):
    name = input("Enter Name to Delete: ")

    if name in contacts:
        del contacts[name]
        print("Contact deleted successfully!")
    else:
        print("Contact not found.")

#UDF for displaying contacts
def display_contacts(contacts):
    if len(contacts) == 0:
        print("No contacts available.")
    else:
        print("\nAll Contacts:")
        for name, details in contacts.items():
            print("-------------------------")
            print("Name :", name)
            print("Phone:", details["phone"])
            print("Email:", details["email"])

def main():
    contacts = {}

    while True:
        print("\n===== Contact Book =====")
        print("1. Add Contact")
        print("2. Search Contact")
        print("3. Delete Contact")
        print("4. Display All Contacts")
        print("5. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            add_contact(contacts)

        elif choice == "2":
            search_contact(contacts)

        elif choice == "3":
            delete_contact(contacts)

        elif choice == "4":
            display_contacts(contacts)

        elif choice == "5":
            print("Goodbye!")
            break

        else:
            print("Invalid choice. Please try again.")


main()