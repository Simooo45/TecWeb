package esame;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AssociaArticoloServlet extends HttpServlet{
    @Override
    public void init() throws ServletException {
        super.init();    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nomeArticolo = (String) req.getParameter("nomeArticolo");
        System.out.println(nomeArticolo);
        HttpSession session = req.getSession();
        ListaArticoli articoli = (ListaArticoli) getServletContext().getAttribute("listaArticoli");
        Articolo articolo = articoli.getArticle(nomeArticolo);
        if (articolo == null){
            articolo = new Articolo();
            articolo.setName(nomeArticolo);
            articolo.setWriteble(true);
            articolo.setAccess(1);
            // Aumenta il contatore delle persone che stanno scrivendo l'articolo
            articoli.addArticle(nomeArticolo, articolo);
            System.out.println(articolo.getName());
            session.setAttribute("articolo", articoli.getArticle(nomeArticolo));
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        session.setAttribute("articolo", articoli.getArticle(nomeArticolo));
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        return;
    }
}
