from factory.world_factory import WorldFactory
from model.cyberpunk.cyberpunk_world import CyberPunkWorld
from model.cyberpunk.cyberpunk_settlement import CyberPunkSettlement
from model.cyberpunk.cyberpunk_warrior import CyberPunkWarior


class CyberPunkWorldFactory(WorldFactory):
    def createWorld(self):
        return CyberPunkWorld(name="Ready Player One")
    
    def createSettlement(self):
        return CyberPunkSettlement(name="The Oasis", defense_level=80000)
    
    def createWarrior(self):
        return CyberPunkWarior(name="The sixers", weapon="Money", power_level=1000000)