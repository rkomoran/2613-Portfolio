class Dog:
    species = "Canis familiaris"

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"{self.name} is {self.age} years old"
    
    def speak(self, sound):
        return f"{self.name} barks: {sound}"


class JackRussellTerrier(Dog):
    # sound="Arf" is a default argument
    def speak(self, sound="Arf"):
        return super().speak(sound)

class GoldenRetriever(Dog):
    def speak(self, sound="Bark"):
        return super().speak(sound)
    
class Dachshund(Dog):
    pass

class Bulldog(Dog):
    pass    


miles = JackRussellTerrier("Miles", 4)
buddy = Dachshund("Buddy", 9)
jack = Bulldog("Jack", 3)
jim = Bulldog("Jim", 5)
bella = GoldenRetriever("Bella", 5)

print(miles.species)
print(jim.speak("Hi"))

miles = JackRussellTerrier("Miles", 4)
print(miles.speak())
print(miles.speak("Grrr"))

print(bella.speak());
# thor = Dog("Thor", 9)
# print(thor)
# print(thor.speak("hi"))

# class Car:
#     def __init__(self, color, mileage):
#         self.color = color
#         self.mileage = mileage

#     def __str__(self):
#         return f"The {self.color.lower()} car has {self.mileage:,.0f} miles"
    
# car1 = Car("Blue", 20000)
# car2 = Car("Red", 30000)

# print(car1)
# print(car2)