package co.crisi.gencore.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class Behavior {

    private Double aggressiveness;
    private Double socialLevel;
    private Boolean nocturnal;

    @Override
    public String toString() {
        return """
                {
                    "aggressiveness": %s,
                    "socialLevel": %s,
                    "nocturnal": %s
                }
                """.formatted(aggressiveness.toString(), socialLevel.toString(), nocturnal.toString());
    }
}
