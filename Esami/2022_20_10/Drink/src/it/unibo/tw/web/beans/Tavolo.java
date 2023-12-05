package it.unibo.tw.web.beans;
import java.util.ArrayList;


public class Tavolo{
    String idTavolo;
    ArrayList<Utente> utenti;

    public Tavolo(String idTavolo){
        this.idTavolo = idTavolo;
        this.utenti = new ArrayList<Utente>();
    }

    public void addUtente(Utente u){
        this.utenti.add(u);
    }

    public String getIdTavolo() {
        return idTavolo;
    }

    public ArrayList<Utente> getUtenti() {
        return utenti;
    }

    public float totaleTavolo(){
        float totale = 0;
        for (Utente u: this.utenti){
            totale += u.getTotal();
        }
        return totale;
    }

    public ArrayList<Drink> daCons(){
        ArrayList<Drink> daConsegnare = new ArrayList<Drink>();
        for (Utente u: this.utenti){
            for (Drink d: u.getDrinks()){
                if (!d.getStatus()){
                    daConsegnare.add(d);
                }
            }
        }
        return daConsegnare;
    }


}
