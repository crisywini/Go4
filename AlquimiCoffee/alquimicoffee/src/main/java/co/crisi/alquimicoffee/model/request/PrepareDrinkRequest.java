package co.crisi.alquimicoffee.model.request;

import java.util.List;

public record PrepareDrinkRequest(String base, List<String> ingredients) {
}
