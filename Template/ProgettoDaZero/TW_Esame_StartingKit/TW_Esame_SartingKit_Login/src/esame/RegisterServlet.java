package esame;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends SyncHttpServlet {
    @Override
    public synchronized void init() throws ServletException {
        super.init();
        if (getServletContext().getAttribute("utenti") == null) {
            getServletContext().setAttribute("utenti", new GruppoUtenti());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GruppoUtenti utenti = (GruppoUtenti) getServletContext().getAttribute("utenti");

        // Verifica se l'username è già presente
        String username = req.getParameter("username");
        if (utenti.exists(username)) {
            System.out.println("Username già presente");
            req.setAttribute("firstTry", false);
            getServletContext().getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        // Crea un nuovo utente e aggiungilo al GruppoUtenti
        User u = new User();
        u.setName(username);
        u.setPassword(req.getParameter("password"));
        utenti.addUser(u);

        // Aggiorna il GruppoUtenti nell'ambito dell'applicazione
        getServletContext().setAttribute("utenti", utenti);

        // Imposta gli attributi per la visualizzazione nella JSP
        req.setAttribute("username", username);
        req.setAttribute("username", req.getParameter("password"));
        System.out.println("Username disponibile");

        // Esegue il forward alla pagina register.jsp
        getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        return;
    }
}