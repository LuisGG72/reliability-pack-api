# Examples

This page mirrors the runnable examples under [`examples/`](../examples).

## cURL

File: [`examples/curl_examples.sh`](../examples/curl_examples.sh)

Runs:
- health check
- normalize
- contract test
- evidence pack

## JavaScript (Node fetch)

File: [`examples/node.js`](../examples/node.js)

Highlights:
- sets `x-api-key`
- handles non-2xx responses
- prints `run_id`

## Python (requests)

File: [`examples/python.py`](../examples/python.py)

Highlights:
- optional retries with backoff
- timeout control
- prints `run_id`

## Safety note

Examples use placeholders only.
Never commit real API keys, internal URLs, or sensitive IDs.
