import os
import requests

BASE_URL = "https://reliability-pack-worker.animixel.workers.dev"
API_KEY = os.getenv("API_KEY", "REPLACE_WITH_YOUR_KEY")

headers = {
    "x-api-key": API_KEY,
    "content-type": "application/json",
}

payload = {
    "input": "{\"name\": \"alice\", \"active\": \"true\"}"
}

res = requests.post(f"{BASE_URL}/api/normalize", headers=headers, json=payload, timeout=20)
print(res.status_code)
print(res.json())
