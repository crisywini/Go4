from model.warrior import Warrior


class MedievalWarrior(Warrior):
    def __init__(self, name, weapon, power_level):
        super().__init__(name, weapon, power_level)