package co.crisi.gencore.controller;

import co.crisi.gencore.model.Creature;
import co.crisi.gencore.model.CreatureRegistry;

import co.crisi.gencore.model.req.CloneCreatureRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/creatures")
public class CreatureController {

    private final CreatureRegistry registry = new CreatureRegistry();

    @PostMapping
    public Creature createCreature(@RequestBody Creature request) {
        return registry.createCreature(request);
    }

    @PostMapping("/clone")
    public Creature cloneCreature(@RequestBody CloneCreatureRequest request) {
        return registry.getClone(request);
    }


}
