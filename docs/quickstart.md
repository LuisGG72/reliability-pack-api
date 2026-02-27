# Quickstart

Base URL:
- `https://reliability-pack-worker.animixel.workers.dev`

## Step 1: Check health

```bash
curl -sS "https://reliability-pack-worker.animixel.workers.dev/health"
```

## Step 2: Set API key

```bash
export API_KEY="<YOUR_API_KEY>"
```

PowerShell:

```powershell
$env:API_KEY = "<YOUR_API_KEY>"
```

## Step 3: Normalize input

```bash
curl -sS -X POST "https://reliability-pack-worker.animixel.workers.dev/api/normalize" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"input":"{\"name\":\"tom\",\"active\":\"true\"}"}'
```

## Step 4: Contract-test target

```bash
curl -sS -X POST "https://reliability-pack-worker.animixel.workers.dev/api/contract-test" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"tool_url":"https://httpbin.org/status/200","method":"GET","expected_status":200,"max_latency_ms":5000}'
```

## Step 5: Build evidence pack

```bash
curl -sS -X POST "https://reliability-pack-worker.animixel.workers.dev/api/evidence-pack" \
  -H "content-type: application/json" \
  -H "x-api-key: $API_KEY" \
  -d '{"claim":"example claim","sources":[{"url":"https://example.com"}]}'
```

## Full script

Use the runnable full example:
- `examples/curl_examples.sh`

## Traceability

Use `run_id` for execution lookup:

```bash
curl -sS "https://reliability-pack-worker.animixel.workers.dev/api/runs/<RUN_ID>" \
  -H "x-api-key: $API_KEY"
```
