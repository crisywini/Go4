package co.crisi.gencore.model;

import co.crisi.gencore.model.req.CloneCreatureRequest;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@NoArgsConstructor
public class CreatureRegistry {
    private final Map<String, Creature> creatures = new HashMap<>();

    public Creature createCreature(Creature creature){
        creatures.put(creature.getName(), creature);
        return creature;
    }

    public Creature getClone(CloneCreatureRequest request) {
        Creature clone = creatures.get(request.getPrototype()).clone();
        clone.setName(request.getNewName());
        applyOverrides(clone, request);
        creatures.put(request.getNewName(), clone);
        return clone;
    }

    private void applyOverrides(Creature clone, CloneCreatureRequest request) {
        if (request.getDna() != null) clone.setDna(request.getDna());
        if (request.getSkills() != null) clone.setSkills(request.getSkills());

        Stats s = clone.getStats();
        if (request.getHealth() != null || request.getSpeed() != null || request.getStrength() != null) {
            clone.setStats(new Stats(
                    request.getHealth() != null ? request.getHealth() : s.getHealth(),
                    request.getSpeed() != null ? request.getSpeed() : s.getSpeed(),
                    request.getStrength() != null ? request.getStrength() : s.getStrength()
            ));
        }

        Behavior b = clone.getBehavior();
        if (request.getAggressiveness() != null || request.getSocialLevel() != null || request.getNocturnal() != null) {
            clone.setBehavior(new Behavior(
                    request.getAggressiveness() != null ? request.getAggressiveness() : b.getAggressiveness(),
                    request.getSocialLevel() != null ? request.getSocialLevel() : b.getSocialLevel(),
                    request.getNocturnal() != null ? request.getNocturnal() : b.getNocturnal()
            ));
        }
    }
}
