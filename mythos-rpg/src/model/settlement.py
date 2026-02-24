from abc import ABC

class Settlement(ABC):

    def __init__(self, name: str, defense_level: int):
        self.name = name
        self.defense_level = defense_level