#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://reliability-pack-worker.animixel.workers.dev"
API_KEY="${API_KEY:-REPLACE_WITH_YOUR_KEY}"

# Health
curl -sS "$BASE_URL/health" | jq .

# Normalize
curl -sS -X POST "$BASE_URL/api/normalize" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"input":"{\"name\":\"tom\",\"active\":\"true\"}"}' | jq .

# Contract test
curl -sS -X POST "$BASE_URL/api/contract-test" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"tool_url":"https://httpbin.org/status/200","method":"GET","expected_status":200,"max_latency_ms":5000}' | jq .

# Evidence pack
curl -sS -X POST "$BASE_URL/api/evidence-pack" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"claim":"example claim","sources":[{"url":"https://example.com"}]}' | jq .
