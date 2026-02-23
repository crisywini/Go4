package co.crisi.infiniteBooks.factory;

import co.crisi.infiniteBooks.model.Book;
import co.crisi.infiniteBooks.model.Poetry;

public class PoetryFactory extends BookFactory{


    @Override
    public Book createBook(String title) {
        return new Poetry(title);
    }
}
