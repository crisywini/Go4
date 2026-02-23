#!/bin/bash

BASE_URL="http://localhost:8080"

echo "=== Publishing a Poetry book ==="
curl -s -X POST "$BASE_URL/books/publish" \
  -H "Content-Type: application/json" \
  -d '{"type": "poetry", "title": "Leaves of Grass"}' \
  && echo

echo ""
echo "=== Publishing a Philosophical Novel ==="
curl -s -X POST "$BASE_URL/books/publish" \
  -H "Content-Type: application/json" \
  -d '{"type": "philosophicalNovel", "title": "Thus Spoke Zarathustra"}' \
  && echo

echo ""
echo "=== Publishing a Technical Manual ==="
curl -s -X POST "$BASE_URL/books/publish" \
  -H "Content-Type: application/json" \
  -d '{"type": "manual", "title": "The Art of Computer Programming"}' \
  && echo
