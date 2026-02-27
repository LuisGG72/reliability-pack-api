#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://reliability-pack-worker.animixel.workers.dev"
API_KEY="${API_KEY:-REPLACE_WITH_YOUR_KEY}"

call() {
  local name="$1"
  local method="$2"
  local path="$3"
  local body="${4:-}"

  echo "--- ${name}"
  if [[ -n "$body" ]]; then
    curl -sS -X "$method" "${BASE_URL}${path}" \
      -H "content-type: application/json" \
      -H "x-api-key: ${API_KEY}" \
      -d "$body"
  else
    curl -sS -X "$method" "${BASE_URL}${path}"
  fi
  echo
}

call "health" "GET" "/health"

call "normalize" "POST" "/api/normalize" '{"input":"{\"name\":\"tom\",\"active\":\"true\"}"}'

call "contract test" "POST" "/api/contract-test" '{"tool_url":"https://httpbin.org/status/200","method":"GET","expected_status":200,"max_latency_ms":5000}'

call "evidence pack" "POST" "/api/evidence-pack" '{"claim":"example claim","sources":[{"url":"https://example.com"}]}'

# Example run lookup:
# curl -sS -H "x-api-key: ${API_KEY}" "${BASE_URL}/api/runs/<RUN_ID>"
