#!/bin/bash

BASE_URL="http://localhost:8080"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}==============================${NC}"
echo -e "${CYAN}  Oracle of Delphi - Tests   ${NC}"
echo -e "${CYAN}==============================${NC}\n"

# ─── Test 1: Pregunta básica de un usuario ───
echo -e "${YELLOW}[TEST 1] Pregunta básica de un usuario${NC}"
curl -s -X POST "$BASE_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{"user": "crisi", "question": "¿Tiene sentido el universo?"}' | jq .
echo ""

# ─── Test 2: Otro usuario hace una pregunta ───
echo -e "${YELLOW}[TEST 2] Otro usuario hace una pregunta${NC}"
curl -s -X POST "$BASE_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{"user": "juan", "question": "¿Qué es la consciencia?"}' | jq .
echo ""

# ─── Test 3: Body vacío - debe retornar 400 ───
echo -e "${YELLOW}[TEST 3] Body vacío - debe retornar 400${NC}"
curl -s -X POST "$BASE_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{}' | jq .
echo ""

# ─── Test 4: Falta el campo question ───
echo -e "${YELLOW}[TEST 4] Falta campo 'question' - debe retornar 400${NC}"
curl -s -X POST "$BASE_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{"user": "crisi"}' | jq .
echo ""

# ─── Test 5: Falta el campo user ───
echo -e "${YELLOW}[TEST 5] Falta campo 'user' - debe retornar 400${NC}"
curl -s -X POST "$BASE_URL/ask" \
  -H "Content-Type: application/json" \
  -d '{"question": "¿Existe el libre albedrío?"}' | jq .
echo ""

# ─── Test 6: Crisi camino al enlightenment (10 preguntas seguidas) ───
echo -e "${YELLOW}[TEST 6] Crisi hace 10 preguntas seguidas - camino al enlightenment${NC}"
for i in $(seq 1 10); do
  echo -e "  Pregunta $i:"
  curl -s -X POST "$BASE_URL/ask" \
    -H "Content-Type: application/json" \
    -d "{\"user\": \"crisi\", \"question\": \"Pregunta existencial número $i\"}" | jq .
  echo ""
done

# ─── Test 7: Concurrencia - múltiples usuarios al mismo tiempo ───
echo -e "${YELLOW}[TEST 7] Concurrencia - 5 usuarios preguntan al mismo tiempo${NC}"
for user in "socrates" "platon" "aristoteles" "nietzsche" "kant"; do
  curl -s -X POST "$BASE_URL/ask" \
    -H "Content-Type: application/json" \
    -d "{\"user\": \"$user\", \"question\": \"¿Cuál es mi propósito?\"}" | jq . &
done
wait
echo ""

echo -e "${GREEN}==============================${NC}"
echo -e "${GREEN}  Tests completados          ${NC}"
echo -e "${GREEN}==============================${NC}"