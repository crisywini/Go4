package service

import (
	"github.com/crisywini/Go4/CriticOS/internal/adapter"
	"github.com/crisywini/Go4/CriticOS/internal/model"
)

type ReviewService struct {
	Adapters []adapter.ReviewSourceAdapter
}

func NewReviewService() *ReviewService {

	adapters := []adapter.ReviewSourceAdapter{
		adapter.NewAmazonBooksAdapter(),
		adapter.NewGoodReadsAdapter(),
		adapter.NewLibrarythingAdapter(),
		adapter.NewOpenLibraryAdapter(),
	}

	return &ReviewService{Adapters: adapters}
}

func (service ReviewService) GetReviews() []model.Review {
	var reviews []model.Review
	for _, r := range service.Adapters {
		reviews = append(reviews, r.GetReview())
	}
	return reviews
}
