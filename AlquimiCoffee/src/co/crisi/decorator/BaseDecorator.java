package co.crisi.decorator;

import co.crisi.model.ICoffee;

public class BaseDecorator implements ICoffee {

    protected ICoffee wrapper;

    public BaseDecorator(ICoffee wrapper) {
        this.wrapper = wrapper;
    }

    @Override
    public String addAddition() {
        return wrapper.addAddition();
    }
}
