from world_factory import WorldFactory
from model.medieval.medieval_world import MedievalWorld
from model.medieval.medieval_settlement import MedievalCastle
from model.medieval.medieval_warrior import MedievalWarrior

class MedievalWorldFactory(WorldFactory):
    def createWorld(self, name):
        return MedievalWorld(name)
    
    def createSettlement(self, name, defense_level):
        return MedievalCastle(name, defense_level)
    
    def createWarrior(self, name, weapon, power_level):
        return MedievalWarrior(name, weapon, power_level)