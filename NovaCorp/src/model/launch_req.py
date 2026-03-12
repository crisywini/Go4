from pydantic import BaseModel



class LaunchRocket(BaseModel):
    latitude: float
    longitude: float
    fuel: float