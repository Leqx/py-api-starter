from pydantic import BaseSettings

class Settings(BaseSettings):
    app_name: str = "FastAPI Template"
    admin_email: str = "admin@example.com"

    class Config:
        env_file = ".env"

settings = Settings()
