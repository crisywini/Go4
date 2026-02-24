from abc import ABC, abstractmethod
from model.world import World
from model.settlement import Settlement
from model.warrior import Warrior

class WorldFactory(ABC):

    def __init__(self):
        super().__init__()

    @abstractmethod
    def createWorld(self) -> World:
        pass

    @abstractmethod
    def createSettlement(self) -> Settlement:
        pass
    
    @abstractmethod
    def createWarrior(self) -> Warrior:
        pass