# Endpoints

## Public

- `GET /health`
- `GET /api/version`
- `GET /openapi.json`
- `GET /llms.txt`
- `GET /.well-known/agent.json`
- `GET /mcp/manifest.json`
- `GET /api/public-stats`
- `GET /api/public-analytics`
- `GET /api/public-ops`

## Private

- `POST /api/normalize`
- `POST /api/contract-test`
- `POST /api/contract-test/schedule`
- `GET /api/contract-test/schedule`
- `POST /api/contract-test/schedule/run-now`
- `POST /api/evidence-pack`
- `GET /api/runs/{run_id}`
- `GET /api/stats`

## Main payloads

### POST /api/normalize

Request fields:
- `input` (required): string or object.

Response highlights:
- `run_id`
- `normalized`
- `warnings`
- `timing_ms`

Behavior note:
- Performs JSON-like normalization (null cleanup and scalar type inference).
- Does not interpret natural-language date/time intent.

### POST /api/contract-test

Request fields:
- `tool_url` (required)
- `method` (optional)
- `expected_status` (optional)
- `max_latency_ms` (optional)

Response highlights:
- `run_id`
- `passed`
- `source_health`
- `schema_checked`
- `latency_ms`
- `warnings`

### POST /api/evidence-pack

Request fields:
- `claim` (required)
- `sources[]` (required)
- `hash_algorithm` (optional)

Response highlights:
- `run_id`
- `evidence_id`
- `verified`
- `pack_hash`
- `sources[]`
