package co.crisi.gencore.model;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Creature implements Cloneable {

    private String name;
    private String dna;
    private List<String> skills;
    private Stats stats;
    private Behavior behavior;

    @SneakyThrows
    @Override
    public Creature clone() {
        Creature copy = (Creature) super.clone();
        copy.skills = new ArrayList<>(this.skills);
        copy.stats = new Stats(this.stats.getHealth(),
                this.stats.getSpeed(), this.stats.getStrength());
        copy.behavior = new Behavior(this.behavior.getAggressiveness(),
                this.behavior.getSocialLevel(), this.behavior.getNocturnal());
        return copy;
    }

    @Override
    public String toString() {
        return "{" +
                "name:" + name + '\n' +
                ", dna:" + dna + '\n' +
                ", skills:" + skills +
                ", stats:" + stats +
                ", behavior:" + behavior +
                '}';
    }
}
