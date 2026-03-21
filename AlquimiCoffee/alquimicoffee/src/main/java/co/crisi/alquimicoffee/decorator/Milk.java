package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class Milk extends BaseDecorator{
    public Milk(Coffee wrapper) {
        super(wrapper);
    }


    @Override
    public String addAddition() {
        return wrapper.addAddition() + " + Milk";
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost() + 5.0;
    }
}
