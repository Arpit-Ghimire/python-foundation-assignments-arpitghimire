from abc import ABC, abstractmethod

class PaymentMethod(ABC):
    @abstractmethod
    def pay(self, amount):
        pass

class CreditCard(PaymentMethod):
    def pay(self, amount):
        print(f"Paid {amount} using Credit Card.")

class Esewa(PaymentMethod):
    def pay(self, amount):
        print(f"Paid {amount} using Esewa.")

class MobileBanking(PaymentMethod):
    def pay(self, amount):
        print(f"Paid {amount} using Mobile Banking.")


# Processing payments polymorphically
payments = [CreditCard(), Esewa(), MobileBanking()]

for method in payments:
    method.pay(1000)

# Verify direct instantiation fails
try:
    p = PaymentMethod()
except TypeError as e:
    print(f"Error: {e}")