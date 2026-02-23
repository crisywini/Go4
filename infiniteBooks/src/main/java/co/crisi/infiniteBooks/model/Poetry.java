package co.crisi.infiniteBooks.model;

public class Poetry extends Book{
    public Poetry(String title) {
        super(title);
    }

    @Override
    public String publish() {
        return "Revisión Métrica\nTipografía especial";
    }
}
