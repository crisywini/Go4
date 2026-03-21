package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class Caramel extends BaseDecorator{


    public Caramel(Coffee wrapper) {
        super(wrapper);
    }

    @Override
    public String addAddition() {
        return wrapper.addAddition() + " + Caramel";
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost() + 2.0;
    }
}
