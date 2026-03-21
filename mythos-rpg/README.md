# mythos-rpg — Abstract Factory Pattern

**Language:** Python

## Pattern

The **Abstract Factory** pattern provides an interface for creating families of related objects without specifying their concrete classes, ensuring all created objects are compatible with each other.

## Structure

```
WorldFactory (abstract)
├── createWorld()
├── createSettlement()
└── createWarrior()

MedievalWorldFactory   → MedievalWorld, MedievalCastle, MedievalWarrior
CyberPunkWorldFactory  → CyberPunkWorld, CyberPunkSettlement, CyberPunkWarrior
```

## How it works

Each concrete factory creates a full themed family of objects. Swapping `MedievalWorldFactory` for `CyberPunkWorldFactory` produces an entirely different game world without touching client code. All objects from the same factory are guaranteed to be theme-compatible.
