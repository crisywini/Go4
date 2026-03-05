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

type LibraryThing struct {
	stars int
	notes string
}
