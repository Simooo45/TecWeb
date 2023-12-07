package esame;

import java.util.HashMap;
import java.util.Map;

public class GruppoUtenti {
    private Map<String, User> utenti;

    public GruppoUtenti(){
        this.utenti = new HashMap<String, User>();
    }

    public Map<String, User> getUtenti() {
        return utenti;
    }

    public void setUtenti(Map<String, User> utenti) {
        this.utenti = utenti;
    }

    public User getUser(String username){
        return this.utenti.get(username);
    }

    public boolean addUser(User u) {
        if (!exists(u.getName())){
            this.utenti.put(u.getName(), u);
            return true;
        }
        return false;
    }
    
    public boolean exists(String s){
        if (s == null || this.utenti.get(s) == null){
            return false;
        }
        return true;
    }

    public boolean exists(User u){
        if (this.utenti.get(u.getName()) == null){
            return false;
        }
        return true;
    }

    public boolean checkPassword(String username, String password){
        if (username == null || password == null){
            return false;
        }
        User user = getUser(username);
        return user != null && password.equals(user.getPassword());
    }

    public String debugEcho(){
        return "Echo! Fin qui ci siamo";
    }
}