package co.crisi.alquimicoffee.service;

import co.crisi.alquimicoffee.model.request.PrepareDrinkRequest;
import co.crisi.alquimicoffee.model.response.DrinkPreparedResponse;

public interface ICoffeeService {
    DrinkPreparedResponse prepareDrink(PrepareDrinkRequest request);
}
