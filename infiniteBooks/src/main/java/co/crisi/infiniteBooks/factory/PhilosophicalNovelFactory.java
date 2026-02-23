package co.crisi.infiniteBooks.factory;

import co.crisi.infiniteBooks.model.Book;
import co.crisi.infiniteBooks.model.PhilosophicalNovel;

public class PhilosophicalNovelFactory extends BookFactory{
    @Override
    public Book createBook(String title) {
        return new PhilosophicalNovel(title);
    }
}
