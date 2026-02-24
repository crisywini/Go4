from fastapi import FastAPI

from handler import world_handler


app =  FastAPI(title="World creator RPG", version="1.0.0")

app.include_router(world_handler.router)

@app.get
def health_check():
    return {"status": "ok"}