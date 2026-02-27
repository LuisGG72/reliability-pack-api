# Auth

## Public endpoints

No API key required:
- `GET /health`
- `GET /api/version`
- `GET /openapi.json`
- `GET /llms.txt`
- `GET /.well-known/agent.json`
- `GET /mcp/manifest.json`
- `GET /api/public-stats`
- `GET /api/public-analytics`
- `GET /api/public-ops`

## Private endpoints

Private endpoints require `x-api-key`.

Header format:

```http
x-api-key: <YOUR_API_KEY>
```

## Retry guidance

Recommended client behavior:
- On `429`, back off and honor `Retry-After`.
- On `5xx`, retry with exponential backoff.
- On `400/401/403`, do not retry blindly.

## Rate limits

Rate limiting is enforced server-side per key and source context.
Your effective budget depends on current service configuration.
