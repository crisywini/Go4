package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class ExtraShot extends BaseDecorator{
    public ExtraShot(Coffee wrapper) {
        super(wrapper);
    }

    @Override
    public String addAddition() {
        return wrapper.addAddition() + " + Extra Shot";
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost() + 2.5;
    }
}
