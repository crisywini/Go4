package co.crisi.infiniteBooks.model;

public class TechnicalManual extends Book{
    public TechnicalManual(String title) {
        super(title);
    }

    @Override
    public String publish() {
        return "Revisión de exactitud\nDiagramas";
    }
}
