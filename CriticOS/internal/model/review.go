package model

type Review struct {
	Score   int
	Content string
	Source  string
}

type GoodReadsReview struct {
	Rating     int
	ReviewText string
}

type OpenLibraryReview struct {
	Score   int
	Comment string
}

type LibraryThingReview struct {
	Stars int
	Notes string
}

type AmazonBooksReview struct {
	ProductRating  int
	CustomerReview string
	Seller         string
}
