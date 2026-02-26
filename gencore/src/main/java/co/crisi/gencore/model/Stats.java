package co.crisi.gencore.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class Stats {
    private Double health;
    private Double speed;
    private Double strength;

    @Override
    public String toString() {
        return """
                {
                    "health": %s,
                    "speed": %s,
                    "strength": %s
                }
                """.formatted(health.toString(), speed.toString(), strength.toString());
    }
}
