# AlquimiCoffee — Decorator Pattern

**Language:** Java

## Pattern

The **Decorator** pattern dynamically adds responsibilities to an object by wrapping it in decorator objects, without modifying its class.

## Structure

```
Coffee (interface)
├── BaseCoffee          ← concrete component (Espresso, $7.0)
└── BaseDecorator       ← abstract decorator (wraps a Coffee)
    ├── Milk            ← adds " + Milk", +$5.0
    ├── Caramel         ← adds " + Caramel", +$3.0
    ├── ExtraShot       ← adds " + Extra Shot", +$4.0
    ├── WhippedCream    ← adds " + Whipped Cream", +$2.5
    └── Cinnamon        ← adds " + Cinnamon", +$1.5
```

## How it works

Decorators wrap a `Coffee` object and delegate calls to it while extending `getDescription()` and `getCost()`. They can be stacked in any combination:

```java
Coffee order = new Cinnamon(new Milk(new Caramel(new BaseCoffee())));
// "Espresso + Caramel + Milk + Cinnamon" → $16.5
```
