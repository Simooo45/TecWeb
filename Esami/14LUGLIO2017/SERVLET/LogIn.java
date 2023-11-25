package Servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Beans.Catalogo;
import Beans.GruppoUtenti;
import Beans.Item;
import Beans.User;

/* CONFIGURO E INIZIALIZZO LA SERVLET e gli UTENTI, dato che secondo le direttive del problema gli utenti sono gia registrati lato server,
creo quindi 5 diversi CLASSI UTENTE ( JAVA BEANS) ( di cui uno è admin) assegnando loro nome, password e gruppo.
Li inserisco in una lista che chiamo utentiRegistrati, che ha come chiave il nome dell utente.
Fa la medesima cosa con la lista gruppi, nella quale salvo le due classi GRUPPIUTENTI in una lista, con chiave l'id del gruppo*/ 

public class LogIn extends HttpServlet{
	
	private Gson g;
	
	@Override
	public void init(ServletConfig conf) throws ServletException
	{
		super.init(conf);
		g = new Gson();
		Map<String,User> utentiRegistrati = new HashMap<String, User>();
		User u = new User();
		u.setUserName("pinco pallino");
		u.setPwd("asdasd");
		u.setGroupId("g01");
		
		utentiRegistrati.put(u.getUserName(), u);
		
		
		u = new User();
		u.setUserName("tizio");
		u.setPwd("asdasd");
		u.setGroupId("g02");
		
		utentiRegistrati.put(u.getUserName(), u);
		
		u = new User();
		u.setUserName("caio");
		u.setPwd("asdasd");
		u.setGroupId("g02");
		
		utentiRegistrati.put(u.getUserName(), u);
		
		u = new User();
		u.setUserName("sempronio");
		u.setPwd("asdasd");
		u.setGroupId("g02");
		
		utentiRegistrati.put(u.getUserName(), u);
		
		
		u = new User();
		u.setUserName("admin");
		u.setPwd("admin");
		
		utentiRegistrati.put(u.getUserName(), u);
		
		this.getServletContext().setAttribute("utentiRegistrati", utentiRegistrati);
        /* imposta un attributo all'interno del ServletContext.
        In questo caso, l'attributo si chiama "utentiRegistrati" e il valore associato a questo attributo è la lista descritta sopra.
        L'uso di setAttribute consente di memorizzare dati all'interno del ServletContext, che può essere accessibile da diverse parti dell'applicazione web.
         Ad esempio, altri servlet o componenti dell'applicazione possono accedere a questo attributo tramite il ServletContext per ottenere o modificare l'elenco degli utenti registrati.
        */
		Map<String, GruppoUtenti> gruppi = new HashMap<String, GruppoUtenti>();
		GruppoUtenti gu = new GruppoUtenti();
		gu.setId("g01");
		gruppi.put(gu.getId(), gu);
		gu = new GruppoUtenti();
		gu.setId("g02");
		gruppi.put(gu.getId(), gu);
		this.getServletContext().setAttribute("gruppi", gruppi);
		/* faccio la stessa cosa descritta sopra, con la mappa gruppi*/
	
		
	}
	
	
	public void doPost(HttpServletRequest request,
            HttpServletResponse response)
    throws ServletException, IOException
	{
		String name = request.getParameter("userName");
		Map<String,User> utentiRegistrati = (Map<String, User>) this.getServletContext().getAttribute("utentiRegistrati");
		User utente = utentiRegistrati.get(name);
		HttpSession session = request.getSession();
        /* Estrae il parametro chiamato "userName" dalla richiesta HTTP e lo salva nella variabile name
        Ottiene una mappa degli utenti registrati dall'attributo "utentiRegistrati" memorizzato nel contesto dell'applicazione.
        Ottiene la sessione corrente dalla quale deriva la richiesta*/
		if(utente == null)
		{
			//utente non registrato
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");	
			rd.forward(request, response);
			return;
            /*Verifica se l'utente è presente tra gli utenti registrati. Se non è presente, lo reindirizza alla pagina di login (/index.jsp). */
		}
		session.setAttribute("currentUser", utente);
        /* se è presente, salva l'utente corrente nell attributo currentUser */
		
		if(utente.getUserName().compareTo("admin")==0 && utente.getPwd().compareTo("admin")==0)
		{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminPage.jsp");	
			rd.forward(request, response);
			return;
            /*Se l'utente è l'admin, lo reindirizza alla pagina di amministrazione (/adminPage.jsp). */
		}
		
		if(utente.getPwd().compareTo(request.getParameter("pwd"))!=0)
		{
//se pwd errata, reindirizza alla pagina di login
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");	
			rd.forward(request, response);
			return;
		}
		
		
		utente.setSession(session);
        /*a sessione corrente a quell'utente specifico. Questo è utile perché consente all'oggetto utente di accedere alla sessione durante la sua interazione con l'applicazione web. */
		Map<String, GruppoUtenti> gruppi = (Map<String, GruppoUtenti>)this.getServletContext().getAttribute("gruppi");
		GruppoUtenti gruppo = gruppi.get(utente.getGroupId());
        /* Recupero tutti i gruppi e prendo quello relativo al mio utente tramite il metodo definito nella classe javaBean */
		// ci andrebbe un controllo, ma do per scontato che non torni null
		
		gruppo.addUserToGroup(utente);
		
		session.setAttribute("gruppo", gruppo);
        /*Aggiungo utente al suo gruppo, e lo setto globalmente all'interno della sessione */
		
		response.sendRedirect("catalogo.jsp");
//		RequestDispatcher rd = getServletContext().getRequestDispatcher("/catalogo.jsp");
//		
//		rd.forward(request, response);
		

        /*Spesso, la scelta tra sendRedirect e forward dipende dalle esigenze dell'applicazione. 
        sendRedirect crea una nuova richiesta, mentre forward instrada internamente la richiesta senza coinvolgere il browser del cliente. 
        Nel codice fornito, sembra che la decisione sia stata presa di utilizzare sendRedirect per reindirizzare l'utente alla pagina del catalogo. */
	}
	
	
	public void doGet(HttpServletRequest request,
            HttpServletResponse response)
    throws ServletException, IOException
	{}
	

}
