package co.crisi.model;



public class Coffee implements  ICoffee {

    private String description;
    private Double cost;


    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String addAddition() {
        return description;
    }
}
