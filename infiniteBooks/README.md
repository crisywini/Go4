# infiniteBooks — Factory Method Pattern

**Language:** Java

## Pattern

The **Factory Method** pattern defines an interface for creating an object but lets subclasses decide which class to instantiate, decoupling creation from usage.

## Structure

```
BookFactory (abstract)
└── createBook(title)  ← factory method

├── PhilosophicalNovelFactory  → PhilosophicalNovel
├── PoetryFactory              → Poetry
└── TechnicalManualFactory     → TechnicalManual

Book (abstract)
└── publish()          ← each subclass defines its own publishing steps
```

## How it works

`BookFactory` declares the abstract `createBook()` method. Each concrete factory overrides it to instantiate a specific `Book` subclass with tailored publishing behavior. Clients depend only on `BookFactory` and `Book`, never on concrete types.
