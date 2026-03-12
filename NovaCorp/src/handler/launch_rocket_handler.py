from fastapi import APIRouter
from service.rocket_system import RocketSystem
from model.launch_req import LaunchRocket
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/rockets")

service = RocketSystem()

@router.post("/launch")
def launch_rocket(req: LaunchRocket):
    service.launch_rocket(req.latitude, req.longitude, req.fuel)
    return JSONResponse(
        {"message":"Rocket launched successfully"}, 
        200
    )