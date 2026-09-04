class Vehicle:
    def __init__(self,brand):
        self.brand = brand

class Car(Vehicle):
    def __init__(self,brand,model):
        super().__init__(brand)
        self.model = model

class SportsCar(Car):
    def __init__(self,brand,model,top_speed):
            super().__init__(brand,model)
            self.top_speed = top_speed

    def describe(self):
        print(f"{self.brand} {self.model} - Top speed: {self.top_speed} km/h")

car = SportsCar("Ferrari", "488 Pista", 340)
car.describe()
print(car.brand, car.model, car.top_speed)