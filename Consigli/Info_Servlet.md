COSA SONO
---------
Le servlet sono **classi Java che estendono `HttpServlet`**.  
Non hanno un costruttore vero e proprio, ma esiste un metodo `init` che richiede come argomento una `Servlet Config`. Segue un esempio di servlet generica:
```
public class MyServlet extends HttpServlet{
    @Override
	public void init(ServletConfig config) throws ServletException 
	{ 
		super.init(config);
	}
}
```  
Oltre ad `init` esistono altri metodi essenziali per il funzionamento:  
- `doGet()`:
    ```
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        ...
    }
    ```
    In esso possono essere utilizzati i metodi `req.getParameter("parameterName")` per ottenere i valori salvati nella richiesta e restituisce il valore attraverso una risposta attraverso `res.getWriter().println(risposta)`.
    
- `doPost()`:
    ```
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ...
    }
    ```  
    Come accade con `doGet` anche con `doPost` è possibile utilizzare parametri presenti nella richiesta attraverso `req.getParameter("parameterName")`.  
    Spesso inoltre il `doPost()` agisce attraverso dei `RequestDispatcher` per innoltrare la richiesta. Ciò avviene attraverso le seguenti linee di codice:
    ```
        // Viene individuato il dispatcher
        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("dispName.jsp");
		// Vengono inoltrate domanda e risposta
        rd.forward(req, res);
        // La funzione termina
		return;
    ```  
Per garantire una comunicazione globale tra servlet vengono utilizzate due funzioni per impostare variabili d'ambiente visibili a tutto il contesto:
```
    this.getServletContext().setAttribute("varName", var);
    this.getServletContext().getAttribute("varName");
```
