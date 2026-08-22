# Python OOP Practice — Book, Shapes, Bank Account & Payments

A set of exercises covering core Object-Oriented Programming concepts in Python: classes, class attributes, polymorphism, encapsulation, classmethods, multilevel inheritance, and abstract base classes.


---

## 📋 Exercises

### Easy
1. **Book class** — `title`, `author` attributes and a `describe()` method.
2. **Class attribute `count`** — tracks how many `Book` instances have been created.

### Medium
1. **Shape polymorphism** — `Shape` base class with `Circle` and `Rectangle` subclasses, each overriding `area()`.
2. **BankAccount encapsulation** — private `__balance` with validated `deposit()` / `withdraw()`.
3. **Alternative constructor** — `Book.from_string("title|author")` using `@classmethod`.

### Hard
1. **Multilevel inheritance** — `Vehicle → Car → SportsCar`, each level adding attributes via `super().__init__()`.
2. **Abstract base class** — `PaymentMethod(ABC)` with `@abstractmethod pay()`, implemented by `CreditCard`, `Esewa`, `MobileBanking`.

---

## 🧩 Challenges Faced

- **Instance vs. class attributes** — early confusion about why `Book.count` is shared across all objects while `self.title` is unique per object. The fix was realizing class attributes live on the class itself, not any single instance.
- **Private attributes aren't truly private** — `__balance` doesn't block access, it just renames it (`_BankAccount__balance`) via name mangling. Understanding *why* Python does this (a convention, not a hard lock) took some digging.
- **`self` vs `cls`** — distinguishing when a method needs a specific object (`self`) versus the class blueprint (`cls`), especially for `from_string()` as an alternative constructor.
- **Weak vs. enforced contracts** — `NotImplementedError` only fails when a method is *called*, so a subclass with a missing method can still be instantiated silently. Switching to `ABC` + `@abstractmethod` moved that failure earlier, to instantiation time.
- **Multilevel `super()` chaining** — making sure each subclass constructor calls `super().__init__(...)` with the right arguments so attributes propagate correctly from `Vehicle` → `Car` → `SportsCar` without duplicating logic.

---

## 💡 Key Learnings

| Concept | Takeaway |
|---|---|
| **Class attributes** | Defined outside `__init__`, shared across all instances (e.g., `Book.count`). Modifying via `self.count = x` creates a separate instance attribute instead — a common trap. |
| **Polymorphism** | Different subclasses can respond to the same method call (`area()`, `pay()`) in their own way. A loop can treat all objects uniformly through a shared interface. |
| **Encapsulation** | Double-underscore attributes (`__balance`) trigger name mangling, discouraging direct outside access and pushing you toward controlled methods like `deposit()`/`get_balance()`. |
| **`@classmethod`** | Receives `cls` instead of `self`, enabling alternative constructors (`from_string`) that still return the correct type — even for subclasses, since `cls(...)` adapts automatically. |
| **Multilevel inheritance** | `super().__init__(...)` chains initialization up the hierarchy, letting a final object accumulate attributes from every ancestor class. |
| **Abstract Base Classes (`ABC`)** | `@abstractmethod` enforces that subclasses implement required methods *before* they can even be instantiated — a stronger guarantee than `NotImplementedError`. |

---

## 🔜 Possible Next Steps

- Add `__str__` / `__repr__` methods for cleaner printing of objects.
- Add custom exceptions (e.g., `InsufficientFundsError`) instead of just printing messages in `BankAccount`.
- Explore `@property` for controlled attribute access as an alternative to explicit getter methods.
- Extend `PaymentMethod` with a `refund()` abstract method to practice multiple abstract methods in one interface.