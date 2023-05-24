from pydantic import BaseSettings


class Settings(BaseSettings):
    # Default configuration
    DEBUG = False
    TESTING = False
    SESSION_PERMANENT = True


SETTINGS = Settings()
