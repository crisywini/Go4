# MiseEnPlace — Builder Pattern

**Language:** Swift

## Pattern

The **Builder** pattern constructs a complex object step by step, separating construction from its representation and enabling fluent, readable object creation.

## Structure

```
Recipe (struct)
└── init(builder: RecipeBuilder)   ← only accepts a builder

RecipeBuilder (class)
├── withName(_)
├── withIngredients(_)
├── withSteps(_)
├── withCookingTime(_)
├── withDifficultyLevel(_)
├── withPairing(_)
└── build() → Recipe              ← validates required fields, returns Recipe
```

## How it works

`RecipeBuilder` exposes fluent methods that each return `self`, allowing chaining. `build()` validates that required fields (`name`, `ingredients`) are present before constructing the `Recipe`. `Recipe` has a private initializer, so the builder is the only way to create one.
