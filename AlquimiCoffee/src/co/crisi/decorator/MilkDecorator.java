package co.crisi.decorator;

import co.crisi.model.Coffee;

public class MilkDecorator extends BaseDecorator {

    private String description = "Milk";
    private Double cost = 5.0;

    public MilkDecorator(Coffee wrapper) {
        super(wrapper);
    }

    @Override
    public String addAddition() {
        var addition = wrapper.addAddition();
        return  addition +
                description;
    }
}
