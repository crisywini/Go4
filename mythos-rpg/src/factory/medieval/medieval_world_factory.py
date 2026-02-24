from factory.world_factory import WorldFactory
from model.medieval.medieval_world import MedievalWorld
from model.medieval.medieval_settlement import MedievalCastle
from model.medieval.medieval_warrior import MedievalWarrior

class MedievalWorldFactory(WorldFactory):
    def createWorld(self):
        return MedievalWorld(name="Medieval World")
    
    def createSettlement(self):
        return MedievalCastle(name="The Hogwarts Castle", defense_level= 1000)
    
    def createWarrior(self):
        return MedievalWarrior(name="Wizards", weapon="Wand", power_level=1000000)