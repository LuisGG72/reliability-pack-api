import os
import time
import requests

BASE_URL = "https://reliability-pack-worker.animixel.workers.dev"
API_KEY = os.getenv("API_KEY", "REPLACE_WITH_YOUR_KEY")


def post_with_retry(path: str, payload: dict, retries: int = 2, timeout: int = 20) -> dict:
    headers = {
        "x-api-key": API_KEY,
        "content-type": "application/json",
    }
    url = f"{BASE_URL}{path}"

    for attempt in range(retries + 1):
        try:
            res = requests.post(url, headers=headers, json=payload, timeout=timeout)
            data = res.json()
            if res.status_code >= 500 and attempt < retries:
                time.sleep(0.7 * (2**attempt))
                continue
            if res.status_code >= 400:
                raise RuntimeError(f"HTTP {res.status_code}: {data}")
            return data
        except Exception:
            if attempt >= retries:
                raise
            time.sleep(0.7 * (2**attempt))

    raise RuntimeError("Unexpected retry state")


def main() -> None:
    normalize = post_with_retry(
        "/api/normalize",
        {"input": "{\"name\": \"alice\", \"active\": \"true\"}"},
    )
    print("normalize run_id:", normalize.get("run_id", "n/a"))

    contract = post_with_retry(
        "/api/contract-test",
        {
            "tool_url": "https://httpbin.org/status/200",
            "method": "GET",
            "expected_status": 200,
            "max_latency_ms": 5000,
        },
    )
    print("contract-test run_id:", contract.get("run_id", "n/a"))


if __name__ == "__main__":
    main()
