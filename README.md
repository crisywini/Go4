# Go4 — Gang of Four Design Patterns

A collection of small, focused projects that implement the 23 classic **Gang of Four** design patterns across multiple languages and domains. Each project is a self-contained app built around a single pattern, making the intent and trade-offs easy to study in isolation.

---

## Projects

| Project | Pattern | Category | Language |
|---|---|---|---|
| [oracle-of-delphi](./oracle-of-delphi) | Singleton | Creational | Go |
| [infiniteBooks](./infiniteBooks) | Factory Method | Creational | Java |
| [mythos-rpg](./mythos-rpg) | Abstract Factory | Creational | Python |
| [MiseEnPlace](./MiseEnPlace) | Builder | Creational | Swift |
| [gencore](./gencore) | Prototype | Creational | Java |
| [NovaCorp](./NovaCorp) | Facade | Structural | Python |
| [AlquimiCoffee](./AlquimiCoffee) | Decorator | Structural | Java |
| [CriticOS](./CriticOS) | Adapter | Structural | Go |
| [CipherVault](./CipherVault) | Proxy | Structural | Swift |
| [MindVault](./MindVault) | Composite | Structural | Go |

---

## Pattern Categories

### Creational
Deal with object creation — abstracting the instantiation process to make systems independent of how objects are created, composed, and represented.

| Pattern | Intent |
|---|---|
| **Singleton** | One instance, global access point |
| **Factory Method** | Subclasses decide which class to instantiate |
| **Abstract Factory** | Families of related objects without specifying concrete classes |
| **Builder** | Complex object construction step by step |
| **Prototype** | Create objects by cloning an existing instance |

### Structural
Deal with object composition — creating relationships between objects to form larger structures.

| Pattern | Intent |
|---|---|
| **Facade** | Simplified interface to a complex subsystem |
| **Decorator** | Dynamically add responsibilities to objects |
| **Adapter** | Convert one interface into another |
| **Proxy** | Surrogate that controls access to another object |
| **Composite** | Tree structures — treat individual objects and compositions uniformly |

### Behavioral
*(coming soon)*

Deal with communication and responsibility between objects.

---

## Quick Reference

### Creational Patterns

#### Singleton — `oracle-of-delphi` (Go)
> Ensures a class has only one instance across the entire application.

```go
oracle := GetInstance()   // always the same Oracle, thread-safe via sync.Once
oracle.Ask("user", "What is the meaning of life?")
```

#### Factory Method — `infiniteBooks` (Java)
> The factory decides which concrete type to create; clients only know the abstract type.

```java
BookFactory factory = new PoetryFactory();
Book book = factory.createBook("Ode to Code");
book.publish();
```

#### Abstract Factory — `mythos-rpg` (Python)
> Swap an entire family of related objects by switching the factory.

```python
factory = CyberPunkWorldFactory()
world    = factory.create_world()
warrior  = factory.create_warrior()   # guaranteed theme-compatible
```

#### Builder — `MiseEnPlace` (Swift)
> Fluent, step-by-step construction with validation before the final object is created.

```swift
let recipe = RecipeBuilder()
    .withName("Sourdough")
    .withIngredients(["flour", "water", "salt"])
    .withCookingTime(45)
    .build()
```

#### Prototype — `gencore` (Java)
> Clone a registered prototype instead of constructing from scratch.

```java
Creature dragon = registry.getClone("dragon");   // deep copy + optional overrides
```

---

### Structural Patterns

#### Facade — `NovaCorp` (Python)
> One call hides the orchestration of multiple subsystems.

```python
rocket = RocketSystem()
rocket.launch_rocket(lat=28.5, long=-80.6, fuel=50000)
# internally: weather → fuel → navigation → comms → countdown
```

#### Decorator — `AlquimiCoffee` (Java)
> Stack wrappers to add behavior without touching the original class.

```java
Coffee order = new Cinnamon(new Milk(new Caramel(new BaseCoffee())));
// "Espresso + Caramel + Milk + Cinnamon" → $16.5
```

#### Adapter — `CriticOS` (Go)
> Translate incompatible interfaces so they can work together.

```go
adapters := []ReviewSourceAdapter{
    GoodReadsAdapter{}, OpenLibraryAdapter{}, AmazonBooksAdapter{},
}
reviews := service.Aggregate(adapters)   // uniform Review{Score, Content, Source}
```

#### Proxy — `CipherVault` (Swift)
> Controls access to a real object — here wrapping sensitive vault operations.

#### Composite — `MindVault` (Go)
> Treat files and folders (leaves and subtrees) through the same interface.

```go
root := NewFolder("MindVault")
root.Add(NewFolder("AI Research"))
root.Add(NewFile("index.txt", 40))
root.GetSize()    // recursive — no distinction between leaf and composite
```

---

## Languages Used

- **Go** — oracle-of-delphi, CriticOS, MindVault
- **Java** — infiniteBooks, gencore, AlquimiCoffee
- **Python** — mythos-rpg, NovaCorp
- **Swift** — MiseEnPlace, CipherVault

---

## Reference

- *Design Patterns: Elements of Reusable Object-Oriented Software* — Gamma, Helm, Johnson, Vlissides (GoF, 1994)
- [Refactoring.Guru — Design Patterns](https://refactoring.guru/design-patterns)
