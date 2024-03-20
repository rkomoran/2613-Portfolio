from abc import ABC, abstractmethod

# creating abstract class TradingCard
class TradingCard(ABC):
    def __init__(self, ID, rarity, yearRelease):
        self.ID = ID
        self.rarity = rarity
        self.yearRelease = yearRelease

    def getID(self):
        return self.ID
    
    def getRarity(self):
        return self.rarity
    
    def getYearRelease(self):
        return self.yearRelease
    
    def setRarity(self, rarity):
        self.rarity = rarity if rarity >= 1 and rarity <= 10 else "Rarity must be between 1 and 10"

    @abstractmethod
    def cost(self):
        pass

    def to_string(self):
        return f"#{self.ID} ({self.year_release}): Rarity: {self.rarity}"

# creating HockeyCard
class HockeyCard(TradingCard):
    def __init__(self, ID, rarity, yearRelease, name, jerseyNum, gamesWon):
        super().__init__(ID, rarity, yearRelease)
        self.name = name
        self.jerseyNum = jerseyNum
        self.gamesWon = gamesWon

    def getName(self):
        return self.name
    
    def getJerseyNum(self):
        return self.jerseyNum
    
    def getGamesWon(self):
        return self.gamesWon
    
    def cost(self):
        return round(self.gamesWon * (2023 - self.getYearRelease())/10 * (0.15 + (self.getRarity()/5)))
    
    def toString(self):
        return f"#{self.getID()} ({self.getYearRelease()}): Rarity: {self.getRarity()} Cost: ${self.cost()}\n\t{self.getName()} (#{self.getJerseyNum()}) - {self.getGamesWon()} Games Won"
    
# creating HockeyCard classes
hockey_card1 = HockeyCard(1234567, 1, 2021, "John Doe", 13, 101)
hockey_card2 = HockeyCard(7654321, 5, 2022, "Jane Smith", 99, 87)

# testing toString
print(hockey_card1.toString())

# testing rarity
hockey_card1.setRarity(20)
print(hockey_card1.getRarity())
# Output: Rarity must be between 1 and 10

hockey_card1.setRarity(4)
print(hockey_card1.getRarity())
# Output: 4

# creating PlayingCard
class PlayingCard(TradingCard):
    def __init__(self, ID, rarity, yearRelease, holographicStatus, condition):
        super().__init__(ID, rarity, yearRelease)
        self.holographicStatus = holographicStatus
        self.condition = condition

    def getHolographicStatus(self):
        return self.holographicStatus

    def getCondition(self):
        return self.condition

    def setCondition(self, condition):
        valid_conditions = ["Mint", "Good", "Poor"]
        self.condition = condition if condition in valid_conditions else "Condition must be 'Mint', 'Good', or 'Poor'"
    
    def conditionCalc(self, condition):
        original_cost = 0
        condition = self.getCondition()

        if condition == 'Mint':
            original_cost = 5.15 * (self.getRarity()/2)
        elif condition == 'Good':
            original_cost = 2.15 * (self.getRarity()/2)
        elif condition == 'Poor':
            original_cost = 0.5 * (self.getRarity()/2)

        return original_cost
    
    def cost(self):
        condition = self.getCondition()
        value = self.conditionCalc(condition)

        return value * 5 if self.getHolographicStatus else value * 1

    def toString(self):
        return f"#{self.getID()} ({self.getYearRelease()}): Rarity: {self.getRarity()} Cost: ${self.cost()}\n\tHolographic: {self.holographicStatus}\t Condition: {self.condition}"

# creating PlayingCards
    
playing_card1 = PlayingCard(9876543, 2, 2020, True, "Mint")
playing_card2 = PlayingCard(2345678, 7, 2023, False, "Good")

# testing toString
print(playing_card1.toString())

# testing condition mutator
playing_card1.setCondition("test")
print(playing_card1.getCondition())
# Output: Condition must be 'Mint', 'Good', or 'Poor'


# storing instances in a list
cards = [hockey_card1, hockey_card2, playing_card1, playing_card2]

# getting total sum
# this gets a list of costs from each card and then sum is applied to the whole list
cardList = (card.cost() for card in cards)
totalSum = sum(cardList)
print(f"Total value of cards: ${totalSum}")

def threeHighest(nums):
    # returns a list of sorted elements by their cost. Needed to use key='lambda' here
    # https://docs.python.org/3/howto/sorting.html
    sortedCards = sorted(nums, key=lambda obj: obj.cost(), reverse=True)

    print("3 Highest Valued Cards")

    for i in range(3):
        print(f"{sortedCards[i].toString()}")

threeHighest(cards)