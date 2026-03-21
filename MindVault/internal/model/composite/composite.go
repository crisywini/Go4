package composite

import (
	"fmt"

	"github.com/crisywini/Go4/MindVault/internal/model"
)

type Folder struct {
	records []model.Record
	name    string
}

func (f Folder) GetSize() int {
	var size int
	for i := 0; i < len(f.records); i++ {
		size += f.records[i].GetSize()
	}
	return size
}

func (f Folder) GetName() string {
	return f.name
}

func (f Folder) Display(ident int) {

	idents := ""
	for i := 0; i < ident; i++ {
		idents += " "
	}
	out := fmt.Sprintf("%s 📁%s (%d)", idents, f.GetName(), f.GetSize())
	fmt.Println(out)

	for i := 0; i < len(f.records); i++ {
		f.records[i].Display(ident + 1)
	}

}

type File struct {
	size int
	name string
}

func (f File) GetSize() int {
	return f.size
}

func (f File) GetName() string {
	return f.name
}

func (f File) Display(ident int) {
	if ident < 0 {
		fmt.Println(f.GetName())
		return
	}
	idents := ""
	for i := 0; i < ident; i++ {
		idents += " "
	}
	out := fmt.Sprintf("%s 📄%s (%d)", idents, f.GetName(), f.GetSize())
	fmt.Println(out)
}

func (f *Folder) Add(r model.Record) {
	f.records = append(f.records, r)
}

func NewFile(name string, size int) *File {
	return &File{name: name, size: size}
}

func NewFolder(name string) *Folder {
	return &Folder{name: name}
}
