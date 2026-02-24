from abc import ABC 


class Warrior(ABC):

    def __init__(self, name: str, weapon: str, power_level: int):
        self.name = name
        self.weapon = weapon
        self.power_level = power_level

        