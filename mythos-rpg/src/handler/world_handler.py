from fastapi import APIRouter, status
from service.create_world import CreateWorldSerice

router = APIRouter(prefix="/world")

service = CreateWorldSerice()

@router.post("/create")
def create_world(req: str):
    return service.create_world(req)