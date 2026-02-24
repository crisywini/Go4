from model.settlement import Settlement


class CyberPunkSettlement(Settlement):
    def __init__(self, name, defense_level):
        super().__init__(name, defense_level)