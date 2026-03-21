package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class WhippedCream extends BaseDecorator{
    public WhippedCream(Coffee wrapper) {
        super(wrapper);
    }

    @Override
    public String addAddition() {
        return wrapper.addAddition() + " + Whipped Cream";
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost() + 3.5;
    }
}
