<!-- pagina per la gestione di errori -->
<%@ page errorPage="../errors/failure.jsp"%>

<!-- accesso alla sessione -->
<%@ page session="true"%>

<!-- import di classi Java -->

<%@ page import="Beans.Cart"%>
<%@ page import="Beans.Item"%>
<%@ page import="Beans.User"%>
<%@ page import="Beans.Ticket"%>
<%@ page import="Beans.GruppoUtenti"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="Beans.Catalogo"%>
<%@ page import="java.util.*"%>


<html>
	<head>
		<meta name="Author" content="pisi79">
		<script type="text/javascript" src="scripts/utils.js"></script>
		<title>Cart JSP</title>
		
	</head>
	
	<body>
		<table>
			<tr>
						<th style="width: 25%">Group id</th>
						<th style="width: 25%">Number of Tickets</th>
						<th style="width: 25%">Finalize</th>
						<th style="width: 25%">Reset</th>
					</tr>
					<%
		Map<String, GruppoUtenti> gruppi = (Map<String, GruppoUtenti>)this.getServletContext().getAttribute("gruppi");
		for(String gid : gruppi.keySet())
		{
			Cart groupCart = gruppi.get(gid).getCarrello();
			if(groupCart != null && groupCart.getNumberOfTickets()>0)
			{
            
			%>
        <!-- Viene ottenuto un riferimento a un oggetto Map denominato "gruppi" dall'oggetto ServletContext.
Si itera attraverso le chiavi di questa mappa (nomi dei gruppi) e per ogni chiave (gid) si esegue una serie di operazioni.
Se riesco a creare un oggetto carrello del gruppo che sto valutando, viene creato un nuovo <tr> nella tabella-->
			<tr>
				<form action="Finalize" method="get">
						
								<td><%= gid %></td>
								<td><%= groupCart.getNumberOfTickets() %> </td>
								
								<td>
								<input type="hidden" name="gid" value="<%=gid%>"/>
								<input type="submit" name="finalize" value="finalize order"/></td>
								<td>
									<input type="hidden" name="gid" value="<%=gid%>"/>
									<input type="submit" name="reset" value="reset order"/>
								</td>
						
					</form>
			
			</tr>
			
			<% }
            <!-- Il form appena visto ha la Servlet "Finalize" in action con metodo GET, ciò significa che passerà la richiesta a essa-->
		}
		%>
		</table>
		
	</body>
</html>