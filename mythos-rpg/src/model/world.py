
from abc import ABC, abstractmethod

class World(ABC):

    def __init__(self, name: str):
        self.name = name
        