package co.crisi.infiniteBooks.factory;

import co.crisi.infiniteBooks.model.Book;
import co.crisi.infiniteBooks.model.TechnicalManual;

public class TechnicalManualFactory extends BookFactory {

    @Override
    public Book createBook(String title) {
        return new TechnicalManual(title);
    }
}
