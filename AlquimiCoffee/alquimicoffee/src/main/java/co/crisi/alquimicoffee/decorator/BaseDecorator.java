package co.crisi.alquimicoffee.decorator;

import co.crisi.alquimicoffee.model.Coffee;

public class BaseDecorator implements Coffee {

    protected Coffee wrapper;


    public BaseDecorator(Coffee wrapper){
        this.wrapper = wrapper;
    }


    @Override
    public String addAddition() {
        return wrapper.addAddition();
    }

    @Override
    public Double calculateCost() {
        return wrapper.calculateCost();
    }
}
