package adapter

import "github.com/crisywini/Go4/CriticOS/internal/model"

type ReviewSourceAdapter interface {
	GetReview() model.Review
}

type GoodReadsAdapter struct {
	Review model.GoodReadsReview
}

func NewGoodReadsAdapter() *GoodReadsAdapter {
	return &GoodReadsAdapter{
		Review: model.GoodReadsReview{
			Rating:     4,
			ReviewText: "Nice",
		},
	}
}

func (adapter GoodReadsAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Rating,
		Content: adapter.Review.ReviewText, Source: "Good Reads"}
}

type OpenLibraryAdapter struct {
	Review model.OpenLibraryReview
}

func NewOpenLibraryAdapter() *OpenLibraryAdapter {
	return &OpenLibraryAdapter{
		Review: model.OpenLibraryReview{
			Score:   5,
			Comment: "Gramatica in french, what a delight",
		},
	}

}

func (adapter OpenLibraryAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Score,
		Content: adapter.Review.Comment, Source: "Open Library"}
}

type LibraryThingAdapter struct {
	Review model.LibraryThingReview
}

func NewLibrarythingAdapter() *LibraryThingAdapter {
	return &LibraryThingAdapter{
		Review: model.LibraryThingReview{
			Stars: 3,
			Notes: "The french language often gets mistreated with these type of translations, this is nice, but could be better",
		},
	}
}

func (adapter LibraryThingAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.Stars,
		Content: adapter.Review.Notes, Source: "Library Thing"}
}

type AmazonBooksAdapter struct {
	Review model.AmazonBooksReview
}

func NewAmazonBooksAdapter() *AmazonBooksAdapter {
	return &AmazonBooksAdapter{
		Review: model.AmazonBooksReview{ProductRating: 5,
			CustomerReview: "Really nice book, explains a lot of french",
			Seller:         "Amazon US"},
	}
}

func (adapter AmazonBooksAdapter) GetReview() model.Review {
	return model.Review{Score: adapter.Review.ProductRating,
		Content: adapter.Review.CustomerReview,
		Source:  adapter.Review.Seller}
}
