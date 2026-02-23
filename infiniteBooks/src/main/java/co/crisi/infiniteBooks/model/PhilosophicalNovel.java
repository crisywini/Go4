package co.crisi.infiniteBooks.model;

public class PhilosophicalNovel extends Book{


    public PhilosophicalNovel(String title) {
        super(title);
    }

    @Override
    public String publish() {
        return "Revisión Narrativa\nDiseño de portada artística";
    }
}
