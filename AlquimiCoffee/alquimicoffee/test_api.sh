# Plain coffee - no ingredients
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":[]}'

# Coffee + Milk
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":["milk"]}'

# Coffee + Caramel
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":["caramel"]}'

# Coffee + Extra Shot
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":["extra_shot"]}'

# Coffee + Whipped Cream
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":["whipped_cream"]}'

# All ingredients - full decorator chain (expected cost: 20.0)
curl -X POST http://localhost:8080/drinks/prepare \
  -H "Content-Type: application/json" \
  -d '{"base":"coffee","ingredients":["milk","caramel","extra_shot","whipped_cream"]}'
