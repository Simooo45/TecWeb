package it.unibo.tw.web.beans;


public class Drink{
    public String name;
    public float price;
    public Boolean status = false;

    public Drink(String name, float price){
        this.name = name;
        this.price = price;
        this.status = false;
    }

    public float getPrice(){
        return price;
    }

    public String getName(){
        return name;
    }

    public Boolean getStatus(){
        return this.status;
    }

    public void consegnato(){
        this.status = true;
    }
}
