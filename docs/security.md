# Security and Data Policy

## Scope

This repository is an integration portal.

## Authentication

- Private endpoints require `x-api-key`.
- Public endpoints do not require auth.

## Transport and traceability

- API is served over HTTPS.
- Responses include `x-request-id`.
- JSON responses include `request_id`.

## Data handling

Current service behavior includes operational persistence for:
- run execution metadata
- tool usage statistics
- schedule execution state
- billing and access-key lifecycle metadata

Public analytics are aggregated and designed to avoid end-user PII exposure.

## Retention and deletion

Retention is governed by operational service needs and may evolve.
For deletion or data requests, contact:
- `ops@reliability-pack-worker.animixel.workers.dev`
