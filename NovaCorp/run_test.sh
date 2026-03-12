#!/bin/bash

BASE_URL="http://localhost:8080"
LAUNCH_ENDPOINT="$BASE_URL/rockets/launch"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

pass() { echo -e "${GREEN}[PASS]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; }

assert_status() {
    local test_name="$1"
    local expected="$2"
    local actual="$3"

    if [ "$actual" -eq "$expected" ]; then
        pass "$test_name (HTTP $actual)"
    else
        fail "$test_name — expected HTTP $expected, got HTTP $actual"
    fi
}

echo "=== NovaCorp Rocket Launch API Tests ==="
echo

# Test 1: Successful launch with valid payload
echo "[Test 1] Launch rocket with valid coordinates and fuel"
status=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$LAUNCH_ENDPOINT" \
    -H "Content-Type: application/json" \
    -d '{"latitude": 28.5, "longitude": -80.6, "fuel": 100.0}')
assert_status "Valid launch request" 200 "$status"

echo

# Test 2: Missing required field (fuel)
echo "[Test 2] Launch request missing 'fuel' field"
status=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$LAUNCH_ENDPOINT" \
    -H "Content-Type: application/json" \
    -d '{"latitude": 28.5, "longitude": -80.6}')
assert_status "Missing fuel field returns 422" 422 "$status"

echo

# Test 3: Invalid field type (latitude as string)
echo "[Test 3] Launch request with invalid field type for latitude"
status=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$LAUNCH_ENDPOINT" \
    -H "Content-Type: application/json" \
    -d '{"latitude": "not-a-number", "longitude": -80.6, "fuel": 100.0}')
assert_status "Invalid latitude type returns 422" 422 "$status"

echo

# Test 4: Empty body
echo "[Test 4] Launch request with empty body"
status=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$LAUNCH_ENDPOINT" \
    -H "Content-Type: application/json" \
    -d '{}')
assert_status "Empty body returns 422" 422 "$status"

echo
echo "=== Tests complete ==="
