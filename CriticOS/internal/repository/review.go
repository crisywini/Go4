package repository

type Review struct {
	score   int
	content string
	source  string
}

type GoodReadsReview struct {
	rating     int
	reviewText string
}

type OpenLibraryReview struct {
	score   int
	comment string
}

type LibraryThingReview struct {
	stars int
	notes string
}

type AmazonBooksReview struct {
	productRating  int
	customerReview string
	seller         string
}
