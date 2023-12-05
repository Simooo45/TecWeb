package it.unibo.tw.web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import it.unibo.tw.web.beans.Tavolo;
import it.unibo.tw.web.beans.Utente;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class assegnaTavolo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private String homeURL = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ArrayList<Tavolo> tavoli = new ArrayList<Tavolo>();
		for (int i = 1; i < 11; i++){
			Tavolo t = new Tavolo("" + i);
			tavoli.add(t);
			this.getServletContext().setAttribute("tavoli", tavoli);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException
	{
		String name = request.getParameter("nome");
		String tavoloName = request.getParameter("tavolo");
		ArrayList<Tavolo> tavoli = (ArrayList<Tavolo>) this.getServletContext().getAttribute("tavoli");
		Tavolo tavolo;
		for (Tavolo t : tavoli){	
			if (t.getIdTavolo().equals(tavoloName)){
				tavolo = t;
			}
		}
		Utente utente;
		for (Utente u : tavolo){	
			if (t.getId().equals(tavoloName)){
				tavolo = t;
			}
		}

		HttpSession session = request.getSession();
//		if(utente == null)
//		{
//			//utente non registrato
//			
//			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");	
//			rd.forward(request, response);
//			return;
//		}
//		session.setAttribute("currentUser", utente);
//		
//		if(utente.getUserName().compareTo("admin")==0 && utente.getPwd().compareTo("admin")==0)
//		{
//			RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminPage.jsp");	
//			rd.forward(request, response);
//			return;
//		}
//		
//		if(utente.getPwd().compareTo(request.getParameter("pwd"))!=0)
//		{
////owd errata
//			
//			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");	
//			rd.forward(request, response);
//			return;
//		}
//		
//		
//		utente.setSession(session);
//		Map<String, GruppoUtenti> gruppi = (Map<String, GruppoUtenti>)this.getServletContext().getAttribute("gruppi");
//		GruppoUtenti gruppo = gruppi.get(utente.getGroupId());
//		// ci andrebbe un controllo, ma do per scontato che non torni null
//		
//		gruppo.addUserToGroup(utente);
//		
//		
//		
//		
//		session.setAttribute("gruppo", gruppo);
//		
//		response.sendRedirect("catalogo.jsp");
//		RequestDispatcher rd = getServletContext().getRequestDispatcher("/catalogo.jsp");
//		
//		rd.forward(request, response);
		
	}
}
