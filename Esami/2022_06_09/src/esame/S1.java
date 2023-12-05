package esame;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class S1 extends HttpServlet {
    public Gson g; 
    public Random r;
    @Override
    public void init() throws ServletException {
        super.init();
        g = new Gson();
        r = new Random();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("");
        if (getServletContext().getAttribute("richieste-attuali") == null){
            getServletContext().setAttribute("richieste-attuali", 1);
        }
        else
            getServletContext().setAttribute("richieste-totali", ((int) getServletContext().getAttribute("richieste-totali")) + 1);
        String text = (String) req.getSession().getAttribute("jsonString");
        char[] chars = text.toCharArray();
        int num = r.nextInt(9) + 1;
        String result = "";
        for (int i = 0; i < chars.length; i++){
            if (i%num != 0){
                result = result + chars[i];
            }
        }
        req.setAttribute("text", result);
        getServletContext().getRequestDispatcher("/s2.jsp");
        return;
    }
    
}
