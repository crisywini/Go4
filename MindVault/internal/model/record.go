package model

type Record interface {
	GetSize() int
	GetName() string
	Display(ident int)
}
