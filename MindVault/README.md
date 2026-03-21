# MindVault — Composite Pattern

**Language:** Go

## Pattern

The **Composite** pattern lets you compose objects into tree structures to represent part-whole hierarchies, treating individual objects and compositions uniformly.

## Structure

```
Record (interface)
├── File            ← leaf node (has a name and size)
└── Folder          ← composite node (contains a list of Records)
    └── Add(Record) ← can hold Files or other Folders
```

## How it works

Both `File` and `Folder` implement the `Record` interface (`GetSize`, `GetName`, `Display`). A `Folder` aggregates any number of `Record` children — including other folders — so the client can call `Display` or `GetSize` on the root without knowing whether it's a leaf or a subtree:

```go
root := composite.NewFolder("MindVault")
root.Add(composite.NewFolder("AI Research"))   // subtree
root.Add(composite.NewFile("index.txt", 40))   // leaf

root.Display(0) // recursively prints the whole tree
root.GetSize()  // recursively sums all file sizes
```
