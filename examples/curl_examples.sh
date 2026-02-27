#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://reliability-pack-worker.animixel.workers.dev"
API_KEY="${API_KEY:-REPLACE_WITH_YOUR_KEY}"

if [[ "$API_KEY" == "REPLACE_WITH_YOUR_KEY" ]]; then
  echo "Set API_KEY before running this script."
  echo "Example: export API_KEY=\"your_real_key\""
  exit 1
fi

extract_run_id() {
  local payload="$1"
  if command -v jq >/dev/null 2>&1; then
    printf '%s' "$payload" | jq -r '.run_id // empty'
    return
  fi
  python -c 'import json,sys; print((json.loads(sys.stdin.read()) or {}).get("run_id",""))' <<<"$payload" 2>/dev/null || true
}

call_public() {
  local name="$1"
  local path="$2"
  echo "--- ${name}"
  curl -sS "${BASE_URL}${path}"
  echo
}

call_private() {
  local name="$1"
  local path="$2"
  local body="$3"
  echo "--- ${name}"
  curl -sS -X POST "${BASE_URL}${path}" \
    -H "content-type: application/json" \
    -H "x-api-key: ${API_KEY}" \
    -d "$body"
  echo
}

call_public "health" "/health"

normalize_res="$(call_private "normalize" "/api/normalize" '{"input":"{\"name\":\"tom\",\"active\":\"true\"}"}')"
echo "$normalize_res"
echo

contract_res="$(call_private "contract test" "/api/contract-test" '{"tool_url":"https://httpbin.org/status/200","method":"GET","expected_status":200,"max_latency_ms":5000}')"
echo "$contract_res"
echo

evidence_res="$(call_private "evidence pack" "/api/evidence-pack" '{"claim":"example claim","sources":[{"url":"https://example.com"}]}')"
echo "$evidence_res"
echo

# Run lookup example with a real run_id from normalize call.
run_id="$(extract_run_id "$normalize_res")"
if [[ -n "$run_id" ]]; then
  echo "--- run lookup (${run_id})"
  curl -sS "${BASE_URL}/api/runs/${run_id}" \
    -H "x-api-key: ${API_KEY}"
  echo
else
  echo "Could not extract run_id from normalize response."
fi
