from abc import ABC, abstractmethod
from model.world import World
from model.settlement import Settlement
from model.warrior import Warrior

class WorldFactory(ABC):

    def __init__(self):
        super().__init__()

    @abstractmethod
    def createWorld(self, name: str) -> World:
        pass

    @abstractmethod
    def createSettlement(self, name: str, defense_level: int) -> Settlement:
        pass
    
    @abstractmethod
    def createWarrior(self, name: str, weapon: str, power_level: int) -> Warrior:
        pass