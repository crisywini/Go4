package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class Cinnamon extends BaseDecorator{
    public Cinnamon(Coffee wrapper) {
        super(wrapper);
    }

    @Override
    public String addAddition() {
        return wrapper.addAddition() + " + Cinnamon";
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost() + 0.5;
    }
}
