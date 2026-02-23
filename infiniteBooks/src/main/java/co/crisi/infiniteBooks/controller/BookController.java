package co.crisi.infiniteBooks.controller;

import co.crisi.infiniteBooks.model.request.PublishRequest;
import co.crisi.infiniteBooks.service.BookService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
@AllArgsConstructor
@Slf4j
public class BookController {

    private final BookService service;

    @PostMapping("/publish")
    public String publishBook(@RequestBody PublishRequest body){
        return  service.publishBook(body);
    }

}
