package esame;

import java.util.*;;

public class ListaArticoli {
    private Map<String, Articolo> articoli;

    public ListaArticoli(){
        this.articoli = new HashMap<String, Articolo>();
    }

    public Map<String, Articolo> getArticoli() {
        return articoli;
    }

    public void setArticoli(Map<String, Articolo> articoli) {
        this.articoli = articoli;
    }

    public void addArticle(String articleName, Articolo article){
        this.articoli.put(articleName, article);
    }

    public Articolo getArticle(String articleName){
        return this.articoli.get(articleName);
    }
    
}
