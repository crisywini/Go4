package co.crisi.alquimicoffee.service;

import co.crisi.alquimicoffee.decorator.*;
import co.crisi.alquimicoffee.model.BaseCoffee;
import co.crisi.alquimicoffee.model.request.PrepareDrinkRequest;
import co.crisi.alquimicoffee.model.response.DrinkPreparedResponse;
import org.springframework.stereotype.Service;

@Service
public class CoffeeService implements ICoffeeService {

    @Override
    public DrinkPreparedResponse prepareDrink(PrepareDrinkRequest request) {
        var base = new BaseCoffee();

        var additions = new BaseDecorator(base);

        for(int i = 0; i<request.ingredients().size(); i++){
            additions = switch (request.ingredients().get(i)) {
                case "milk" -> new Milk(additions);
                case "caramel" -> new Caramel(additions);
                case "extra_shot" -> new ExtraShot(additions);
                case "whipped_cream" -> new WhippedCream(additions);
                case "cinnamon" -> new Cinnamon(additions);
                default -> additions;
            };
        }

        return new DrinkPreparedResponse(additions.addAddition(), additions.calculateCost());
    }
}
