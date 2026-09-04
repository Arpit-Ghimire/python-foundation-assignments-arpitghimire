class BankAccount:
    def __init__(self, initial_balance=0):
        self.__balance = initial_balance  

    def deposit(self, amount):
        if amount <= 0:
            print("Deposit amount must be positive.")
            return
        self.__balance += amount
        print(f"Deposited {amount}. New balance: {self.__balance}")

    def withdraw(self, amount):
        if amount <= 0:
            print("Withdrawal amount must be positive.")
            return
        if amount > self.__balance:
            print("Insufficient funds. Withdrawal denied.")
            return
        self.__balance -= amount
        print(f"Withdrew {amount}. New balance: {self.__balance}")

    def get_balance(self):
        return self.__balance


account = BankAccount(100)
account.deposit(50)       # Deposited 50. New balance: 150
account.withdraw(30)      # Withdrew 30. New balance: 120
account.withdraw(500)     # Insufficient funds. Withdrawal denied.
account.deposit(-10)      # Deposit amount must be positive.

print(f"Final balance: {account.get_balance()}")