package co.crisi.infiniteBooks.factory;

import co.crisi.infiniteBooks.model.Book;

public abstract class BookFactory {
    public abstract Book createBook(String title);
}
