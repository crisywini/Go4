#!/bin/bash

BASE_URL="http://localhost:8080"

echo "=== Create Medieval World ==="
curl -s -X POST "$BASE_URL/world/create?req=medieval" \
  -H "Accept: application/json" | python3 -m json.tool

echo ""
echo "=== Create Cyberpunk World ==="
curl -s -X POST "$BASE_URL/world/create?req=cyberpunk" \
  -H "Accept: application/json" | python3 -m json.tool

echo ""
echo "=== Invalid World Type (expect error) ==="
curl -s -X POST "$BASE_URL/world/create?req=fantasy" \
  -H "Accept: application/json" | python3 -m json.tool
