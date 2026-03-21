# CriticOS — Adapter Pattern

**Language:** Go

## Pattern

The **Adapter** pattern converts the interface of a class into another interface that clients expect, enabling incompatible interfaces to work together.

## Structure

```
ReviewSourceAdapter (interface)
├── GoodReadsAdapter      ← adapts GoodReadsReview   (Rating, ReviewText)
├── OpenLibraryAdapter    ← adapts OpenLibraryReview  (Score, Comment)
├── LibraryThingAdapter   ← adapts LibraryThingReview (Stars, Notes)
└── AmazonBooksAdapter    ← adapts AmazonBooksReview  (ProductRating, CustomerReview, Seller)

ReviewService             ← uses all adapters, aggregates into common Review{Score, Content, Source}
```

## How it works

Each review source has its own data structure. Each adapter implements `GetReview()` to translate its source format into the shared `Review` struct. `ReviewService` calls all adapters uniformly without knowing the underlying differences.
