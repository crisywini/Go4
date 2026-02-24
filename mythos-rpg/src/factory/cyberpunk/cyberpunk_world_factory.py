from world_factory import WorldFactory
from model.cyberpunk.cyberpunk_world import CyberPunkWorld
from model.cyberpunk.cyberpunk_settlement import CyberPunkSettlement
from model.cyberpunk.cyberpunk_warrior import CyberPunkWarior


class CyberPunkWorldFactory(WorldFactory):
    def createWorld(self, name):
        return CyberPunkWorld(name)
    
    def createSettlement(self, name, defense_level):
        return CyberPunkSettlement(name, defense_level)
    
    def createWarrior(self, name, weapon, power_level):
        return CyberPunkWarior(name, weapon, power_level)