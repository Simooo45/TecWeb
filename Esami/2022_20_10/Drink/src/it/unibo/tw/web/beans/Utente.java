package it.unibo.tw.web.beans;

import java.util.ArrayList;

public class Utente  {
    private ArrayList<Drink> drinks = new ArrayList<Drink>();

    private String id;

    public Utente(String id){
        this.id = id;
        this.drinks = new ArrayList<Drink>();
    }

    public String getId(){
        return this.id;
    }

    public float getTotal(){
        float total = 0;
        for (Drink d : this.drinks){
            total += d.getPrice();
        }
        return total;
    }

    public void putDrink(Drink d){
        this.drinks.add(d);
    }

    public ArrayList<Drink> getDrinks(){
        return this.drinks;
    }
}
