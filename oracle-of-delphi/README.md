# oracle-of-delphi — Singleton Pattern

**Language:** Go

## Pattern

The **Singleton** pattern ensures a class has only one instance and provides a global access point to it.

## Structure

```
Oracle (struct)
├── totalQuestions   int
├── lastQuestion     string
├── enlightenedCount int
└── userQuestions    map[string][]string

GetInstance() *Oracle   ← uses sync.Once for thread-safe single initialization
Ask(user, question)     ← mutex-protected state mutation
GetUniverseState()      ← snapshot of current oracle state

OracleService           ← calls GetInstance() to access the singleton
```

## How it works

A package-level `sync.Once` guarantees `Oracle` is initialized exactly once, even under concurrent access. A `sync.Mutex` protects state mutations in `Ask()`. All layers of the application share the same `Oracle` instance via `GetInstance()`.
