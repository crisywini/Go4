package adapter

import "github.com/crisywini/Go4/CriticOS/internal/model"

type ReviewSourceAdapter interface {
	GetReview() model.Review
}

type GoodReadsAdapter struct {
	Review model.GoodReadsReview
}

func (adapter GoodReadsAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Rating,
		Content: adapter.Review.ReviewText, Source: "Good Reads"}
}

type OpenLibraryAdapter struct {
	Review model.OpenLibraryReview
}

func (adapter OpenLibraryAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Score,
		Content: adapter.Review.Comment, Source: "Open Library"}
}

type LibraryThingAdapter struct {
	Review model.LibraryThingReview
}

func (adapter LibraryThingAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Stars,
		Content: adapter.Review.Notes, Source: "Library Thing"}
}

type AmazonBooksAdapter struct {
	Review model.AmazonBooksReview
}

func (adapter AmazonBooksAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.ProductRating,
		Content: adapter.Review.CustomerReview,
		Source:  adapter.Review.Seller}
}
