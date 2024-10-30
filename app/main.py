from fastapi import FastAPI
from app.api.v1.routes import router as api_router

app = FastAPI(
    title="FastAPI Template",
    version="1.0.0",
)

# Include API routes
app.include_router(api_router, prefix="/api/v1")

@app.get("/")
def read_root():
    return {"message": "Welcome to FastAPI with Docker & Poetry!"}
