const BASE_URL = "https://reliability-pack-worker.animixel.workers.dev";
const API_KEY = process.env.API_KEY || "REPLACE_WITH_YOUR_KEY";

const res = await fetch(`${BASE_URL}/api/contract-test`, {
  method: "POST",
  headers: {
    "content-type": "application/json",
    "x-api-key": API_KEY,
  },
  body: JSON.stringify({
    tool_url: "https://httpbin.org/status/200",
    method: "GET",
    expected_status: 200,
    max_latency_ms: 5000,
  }),
});

console.log(res.status);
console.log(await res.json());
