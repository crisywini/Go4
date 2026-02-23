package co.crisi.infiniteBooks.service;

import co.crisi.infiniteBooks.factory.BookFactory;
import co.crisi.infiniteBooks.factory.PhilosophicalNovelFactory;
import co.crisi.infiniteBooks.factory.PoetryFactory;
import co.crisi.infiniteBooks.factory.TechnicalManualFactory;
import co.crisi.infiniteBooks.model.request.PublishRequest;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BookService {

    private final Map<String, BookFactory> factories;

    public BookService(){
        this.factories = new HashMap<>();
        factories.put("philosophicalNovel", new PhilosophicalNovelFactory());
        factories.put("poetry", new PoetryFactory());
        factories.put("manual", new TechnicalManualFactory());

    }

    public String publishBook(PublishRequest request){
        var book = factories.get(request.getType()).createBook(request.getTitle());
        return book.publish();
    }

}
