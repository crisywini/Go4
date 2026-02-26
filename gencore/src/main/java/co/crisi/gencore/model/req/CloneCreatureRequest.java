package co.crisi.gencore.model.req;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
public class CloneCreatureRequest {

    private String prototype;
    private String newName;
    private String dna;
    private List<String> skills;
    private Double health;
    private Double speed;
    private Double strength;
    private Double aggressiveness;
    private Double socialLevel;
    private Boolean nocturnal;
}
