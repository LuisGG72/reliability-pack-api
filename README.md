# FUTURE Reliability Pack API

Public integration portal for the live SaaS API.

- Base URL: `https://reliability-pack-worker.animixel.workers.dev`
- Live docs: `https://reliability-pack-worker.animixel.workers.dev/docs`
- Subscribe: `https://buy.stripe.com/fZucN6fbS7rYgJ06tG1VK00`

## What this repo contains

- Integration docs and examples only.
- OpenAPI contract: [`specs/openapi.json`](./specs/openapi.json)
- Agent discovery files:
  - [`llms.txt`](./llms.txt)
  - [`.well-known/agent.json`](./.well-known/agent.json)
  - [`mcp/manifest.json`](./mcp/manifest.json)

## What this repo does NOT contain

- Internal worker source code.
- Secrets, API keys, webhook secrets, or environment files.
- Internal admin operations as public API surface.

## Authentication

Private endpoints require header `x-api-key`.

```bash
-H "x-api-key: <YOUR_API_KEY>"
```

## Core endpoints

Public:
- `GET /health`
- `GET /api/version`
- `GET /openapi.json`
- `GET /llms.txt`
- `GET /.well-known/agent.json`
- `GET /mcp/manifest.json`
- `GET /api/public-stats`
- `GET /api/public-analytics`
- `GET /api/public-ops`

Private (with `x-api-key`):
- `POST /api/normalize`
- `POST /api/contract-test`
- `POST /api/contract-test/schedule`
- `GET /api/contract-test/schedule`
- `POST /api/contract-test/schedule/run-now`
- `POST /api/evidence-pack`
- `GET /api/runs/{run_id}`
- `GET /api/stats`

## Quick examples

See [`examples/`](./examples):
- `curl_examples.sh`
- `python_example.py`
- `javascript_example.mjs`

## Notes

- Every API response includes header `x-request-id`.
- JSON responses include `request_id` in body (except strict OpenAPI endpoint behavior).
- Scheduler/internal traffic is tracked separately from public business usage in current reporting.
