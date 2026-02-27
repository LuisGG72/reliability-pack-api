const BASE_URL = "https://reliability-pack-worker.animixel.workers.dev";
const API_KEY = process.env.API_KEY || "REPLACE_WITH_YOUR_KEY";

async function post(path, payload) {
  const res = await fetch(`${BASE_URL}${path}`, {
    method: "POST",
    headers: {
      "content-type": "application/json",
      "x-api-key": API_KEY,
    },
    body: JSON.stringify(payload),
  });

  const json = await res.json().catch(() => ({}));
  if (!res.ok) {
    throw new Error(`HTTP ${res.status} ${JSON.stringify(json)}`);
  }

  return json;
}

async function main() {
  try {
    const normalize = await post("/api/normalize", {
      input: "{\"name\": \"alice\", \"active\": \"true\"}",
    });
    console.log("normalize run_id:", normalize.run_id || "n/a");

    const contract = await post("/api/contract-test", {
      tool_url: "https://httpbin.org/status/200",
      method: "GET",
      expected_status: 200,
      max_latency_ms: 5000,
    });
    console.log("contract-test run_id:", contract.run_id || "n/a");
  } catch (error) {
    console.error("request failed:", error.message);
    process.exitCode = 1;
  }
}

main();
