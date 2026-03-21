# gencore — Prototype Pattern

**Language:** Java

## Pattern

The **Prototype** pattern creates new objects by cloning an existing instance, avoiding the cost of building from scratch and hiding creation complexity from clients.

## Structure

```
Creature (implements Cloneable)
└── clone()            ← deep copy of skills, stats, and behavior

CreatureRegistry
├── register(name, creature)
└── getClone(request)  ← clones a registered creature with optional overrides

REST API
└── POST /creatures/clone  ← triggers cloning via CreatureController
```

## How it works

Creatures are registered once in `CreatureRegistry`. When a clone is requested, the registry fetches the prototype, calls `clone()` for a deep copy, and applies any overrides (DNA, skills, stats, behavior) from the request. Clients never instantiate `Creature` directly.
