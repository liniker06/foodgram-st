import os
from dotenv import load_dotenv

load_dotenv()

keys = [
    "POSTGRES_DB",
    "POSTGRES_USER",
    "POSTGRES_PASSWORD",
    "DB_HOST",
    "DB_PORT"
]

for key in keys:
    value = os.getenv(key)
    print(f"{key}: {repr(value)}")
