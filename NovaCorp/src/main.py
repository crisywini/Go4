from fastapi import FastAPI

from handler import launch_rocket_handler


app =  FastAPI(title="Nova Corp launching system", version="1.0.0")

app.include_router(launch_rocket_handler.router)

@app.get
def health_check():
    return {"status": "ok"}