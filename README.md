# FUTURE Reliability Pack API

Operational reliability API for AI agents.

This repository is the public integration portal for the live SaaS service.
It contains docs, manifests, API contract, and client examples.

## Problem

Agent workflows break on malformed payloads, unstable dependencies, and low-trust outputs.

## Solution

FUTURE Reliability Pack provides three API tools:
- Normalize input payloads.
- Contract-test external tools/endpoints.
- Build verifiable evidence packs from source URLs.

## 60-Second Quickstart

Base URL:
- `https://reliability-pack-worker.animixel.workers.dev`

Public health check:

```bash
curl -sS "https://reliability-pack-worker.animixel.workers.dev/health"
```

Private call with API key:

```bash
curl -sS -X POST "https://reliability-pack-worker.animixel.workers.dev/api/normalize" \
  -H "content-type: application/json" \
  -H "x-api-key: <YOUR_API_KEY>" \
  -d '{"input":"{\"name\":\"tom\",\"active\":\"true\"}"}'
```

Expected response shape (example):

```json
{
  "run_id": "run_demo_123",
  "ok": true,
  "normalized": {
    "name": "tom",
    "active": true
  },
  "warnings": [],
  "timing_ms": 31,
  "request_id": "req_demo_123"
}
```

## Core Use Cases

1. `normalize_input`
- Input: mixed or malformed JSON/string payloads.
- Output: normalized payload + `run_id` for traceability.

2. `contract_test_tool`
- Input: target URL + expected status/latency.
- Output: pass/fail health signal + warning summary.

3. `build_evidence_pack`
- Input: claim + source URLs.
- Output: hash-based evidence package references.

## Integration Assets

- OpenAPI contract: [`specs/openapi.json`](./specs/openapi.json)
- `llms.txt`: [`llms.txt`](./llms.txt)
- Agent card: [`.well-known/agent.json`](./.well-known/agent.json)
- MCP manifest: [`mcp/manifest.json`](./mcp/manifest.json)
- Copy/paste examples:
- [`examples/curl_examples.sh`](./examples/curl_examples.sh)
- [`examples/node.js`](./examples/node.js)
- [`examples/python.py`](./examples/python.py)

## Pricing

- Subscription: `https://buy.stripe.com/fZucN6fbS7rYgJ06tG1VK00`
- Access model: API key required for private endpoints.

## Docs

- Quickstart: [`docs/quickstart.md`](./docs/quickstart.md)
- Auth and access: [`docs/auth.md`](./docs/auth.md)
- Endpoints: [`docs/endpoints.md`](./docs/endpoints.md)
- Examples: [`docs/examples.md`](./docs/examples.md)
- Security and data policy: [`docs/security.md`](./docs/security.md)

## Support

- Live docs: `https://reliability-pack-worker.animixel.workers.dev/docs`
- Contact: `ops@reliability-pack-worker.animixel.workers.dev`
