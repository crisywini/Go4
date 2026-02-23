package co.crisi.infiniteBooks.model;

public abstract class Book {

    private final String title;

    public Book(String title){
        this.title = title;
    }

    public abstract String publish();

}
