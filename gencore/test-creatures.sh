#!/bin/bash

BASE_URL="http://localhost:8080/creatures"

echo "=== Crear prototipo: AlphaWolf ==="
curl -s -X POST "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "AlphaWolf",
    "dna": "ATCG-GGTA-CCTA",
    "skills": ["hunt", "stealth", "howl"],
    "stats": {
      "health": 100.0,
      "speed": 85.0,
      "strength": 90.0
    },
    "behavior": {
      "aggressiveness": 7.0,
      "socialLevel": 4.0,
      "nocturnal": true
    }
  }' | python3 -m json.tool 2>/dev/null || echo "Sin salida JSON"

echo ""
echo "=== Clonar sin overrides: ShadowWolf ==="
curl -s -X POST "$BASE_URL/clone" \
  -H "Content-Type: application/json" \
  -d '{
    "prototype": "AlphaWolf",
    "newName": "ShadowWolf"
  }' | python3 -m json.tool 2>/dev/null || echo "Sin salida JSON"

echo ""
echo "=== Clonar sobreescribiendo behavior: FuryWolf (agresividad maxima) ==="
curl -s -X POST "$BASE_URL/clone" \
  -H "Content-Type: application/json" \
  -d '{
    "prototype": "AlphaWolf",
    "newName": "FuryWolf",
    "aggressiveness": 10.0,
    "nocturnal": false
  }' | python3 -m json.tool 2>/dev/null || echo "Sin salida JSON"

echo ""
echo "=== Clonar sobreescribiendo stats: SwiftWolf (velocidad maxima) ==="
curl -s -X POST "$BASE_URL/clone" \
  -H "Content-Type: application/json" \
  -d '{
    "prototype": "AlphaWolf",
    "newName": "SwiftWolf",
    "speed": 100.0,
    "strength": 60.0
  }' | python3 -m json.tool 2>/dev/null || echo "Sin salida JSON"

echo ""
echo "=== Clonar sobreescribiendo todo: MutantWolf ==="
curl -s -X POST "$BASE_URL/clone" \
  -H "Content-Type: application/json" \
  -d '{
    "prototype": "AlphaWolf",
    "newName": "MutantWolf",
    "dna": "GGGG-CCCC-TTTT",
    "skills": ["poison", "flight"],
    "health": 50.0,
    "speed": 95.0,
    "strength": 70.0,
    "aggressiveness": 9.0,
    "socialLevel": 1.0,
    "nocturnal": false
  }' | python3 -m json.tool 2>/dev/null || echo "Sin salida JSON"
