from service.navigation_system import NavigationSystem
from service.communication_system import CommunicationSystem
from service.weather_system import WeatherSystem
from service.fuel_system import FuelSystem


import time

class RocketSystem: 
    
    def __init__(self):
        self.navigation_system = NavigationSystem()
        self.communication_system = CommunicationSystem()
        self.weather_system = WeatherSystem()
        self.fuel_system = FuelSystem()

    def launch_rocket(self, lat: float, long: float, fuel: float):
        self.weather_system.analyze()
        time.sleep(1)
        fuel_check = self.fuel_system.check()
        print(f'The fuel is correct: {fuel_check}')
        time.sleep(1)
        self.fuel_system.load(fuel)
        trajectory = self.navigation_system.calculate_trajectory(lat, long)
        time.sleep(1)
        print(f'Trajectory calculated to {trajectory}')
        self.navigation_system.set_coordinates(lat, long)
        time.sleep(1)
        self.communication_system.connect_to_central()
        time.sleep(4)
        print("Rocket ready for lunch")
        time.sleep(2)
        print("10")
        time.sleep(1)
        print("9")
        time.sleep(1)
        print("8")
        time.sleep(1)
        print("7")
        time.sleep(1)
        print("6")
        time.sleep(1)
        print("5")
        time.sleep(1)
        print("4")
        time.sleep(1)
        print("3")
        time.sleep(1)
        print("2")
        time.sleep(1)
        print("1")
        time.sleep(1)
        print("Rocket launched 🚀")
