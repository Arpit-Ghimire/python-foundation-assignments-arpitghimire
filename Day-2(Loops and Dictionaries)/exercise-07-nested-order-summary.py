"""
Exercise: Nested Order Summary
Student: Arpit Ghimire
Day: 2
"""
#Input
orders = {
    "ORD-001": {
        "customer": "Anisha",
        "amount": 2500,
        "status": "Completed"
    },
    "ORD-002": {
        "customer": "Ravi",
        "amount": 1800,
        "status": "Pending"
    },
    "ORD-003": {
        "customer": "Maya",
        "amount": 3200,
        "status": "Completed"
    }
}

# Order ID and customer
for order_id, details in orders.items():
    print(order_id, "-", details["customer"])

print("\nCompleted Orders:")

#For checking completed total and pending orders
completed_total = 0
pending_count = 0

for order_id, details in orders.items():
    if details["status"] == "Completed":
        print(order_id, details)
        completed_total += details["amount"]
    else:
        pending_count += 1

print("\nTotal Completed Amount:", completed_total)
print("Pending Orders:", pending_count)

# Add new order
orders["ORD-004"] = {
    "customer": "Sagar",
    "amount": 4100,
    "status": "Pending"
}

print("\nUpdated Orders:")
print(orders)