package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class ExtraShort extends BaseDecorator{
    public ExtraShort(Coffee wrapper) {
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
