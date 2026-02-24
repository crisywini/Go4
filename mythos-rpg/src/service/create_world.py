
from model.world import World
from factory.medieval.medieval_world_factory import MedievalWorldFactory
from factory.cyberpunk.cyberpunk_world_factory import CyberPunkWorldFactory

class CreateWorldSerice:

    def __init__(self):
        self.factories = {"medieval": MedievalWorldFactory(), "cyberpunk": CyberPunkWorldFactory()}

    def create_world(self, req: str):
        return {
            "World": self.factories[req].createWorld(),
            "Settlement": self.factories[req].createSettlement(), 
            "Warrior": self.factories[req].createWarrior()
        }
