package co.crisi.alquimicoffee.model;

public class BaseCoffee implements Coffee {


    @Override
    public String addAddition() {
        return "Coffee";
    }

    @Override
    public Double calculateCost() {
        return 7.0;
    }
}
