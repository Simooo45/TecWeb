package esame;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletS1 extends SyncHttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = (String) req.getParameter("TextField");
        try {
            // Leggi il file
            BufferedReader reader = new BufferedReader(new FileReader(fileName));
            StringBuilder content = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
            // Chiudi il lettore
            reader.close();
            String upperCaseContent = content.toString().toUpperCase();
            req.setAttribute("fileContent", upperCaseContent);
            req.setAttribute("target", req.getAttribute("target"));
            getServletContext().getRequestDispatcher("/jspJ2.jsp").forward(req, resp);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
