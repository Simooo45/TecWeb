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


<!-- metodi richiamati nel seguito -->
<%!

void add(Cart cart, int order) {

	cart.add(order);
			
}

double total(Cart cart) {
	double total = 0;
	total = cart.getNumberOfTickets() * 43;
	return total;
}

%>

<!-- codice html restituito al client -->
<html>
	<head>
		<meta name="Author" content="pisi79">
		<script type="text/javascript" src="scripts/utils.js"></script>
		<script type="text/javascript" src="scripts/catalogue.js"></script>
		<title>Cart JSP</title>
		
	</head>

<%
	Integer err = (Integer)session.getAttribute("errore");
	if(err !=null && err ==1)
	{
%>

		
		<body onload="myFunc();">
	<%}
	  else
	  {%>
		  <body>
	  <%}%>

      <!-- Questa non la commenterò perche la funzione myFunc() non esiste e ne tantomeno la classe javascript dalla quale dovrei prenderla.
           Ma a livello teorico sarebbe la funzione incaricata di gestire un erroe ( cosa che infatti non succede).
    -->

				
			<jsp:useBean id="usersGroup" class="Beans.GruppoUtenti" scope="application" />
			<div id="main" class="clear">
                <!--  Crea un oggetto GruppoUtenti valido per l'intera applicazione con id -> user>Group che andrò a riempire quando 
                l'utente cercheà di acquistare uno o piu biglietti dal catalogo -->
			
<%
		
			usersGroup = (GruppoUtenti)session.getAttribute("gruppo");
			Cart cart = usersGroup.getCarrello();
			if (cart == null){
				cart = new Cart();
				usersGroup.setCarrello(cart);
				}
			User utente = (User)session.getAttribute("currentUser");
			
			if ( request.getParameter("empty") != null && request.getParameter("empty").equals("ok") ) {
				cart.empty();
			}

			if ( request.getParameter("add") != null && request.getParameter("add").equals("add to cart") ) {
				
				int order = Integer.parseInt( request.getParameter("order") );
				
				add(cart,order);
				usersGroup.setCarrello(cart);
				session.setAttribute("gruppo", usersGroup);
			}
            <!-- Questo script serve per inizializzare un nuovo carrello di userGroup e riempiendolo solo quando arriverà una request
            dai form sottostanti -->
%>			
	<div id="left" style="float: left; width: 48%; border-right: 1px solid grey">
				<p>Gruppo:<%=usersGroup.getId() %> Utente:<%=utente.getUserName() %></p>
				<p>Select the number of ticket to buy:</p>
				<table class="formdata">
					<tr>
						<th style="width: 25%">Description</th>
						<th style="width: 25%">Price</th>
						<th style="width: 25%">Your order</th>
						<th style="width: 25%"></th>
					</tr>
					
						
				
					<tr>
					<form action="#">
						
								<td>DisneyLand Ticket</td>
								<td>43$</td>
								<td><input type="text" name="order" style="background-color: #c3c3d7;"/></td>
								<td>
									<input type="submit" name="add" value="add to cart"/>
								</td>
						<!-- Primo dei due form, tramite la action # rimanda a se stesso la richiesta e di conseguenza riempe il cart -->
					</form>
						
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>			
			</div>
			
			<div id="right" style="float: right; width: 48%">
				<p>Cart content:</p>
				<table class="formdata">
					<tr>
						<th style="width: 33%">Description</th>
						<th style="width: 33%">Price</th>
						<th style="width: 33%">Your order</th>
					</tr>
					<% 
					if(cart == null)
						cart = new Cart();
					if(cart.getNumberOfTickets() !=0){  
					%> 
						<tr>
							<td>Biglietti nel Carrello: <%=cart.getNumberOfTickets() %></td>
							<td>43 $</td>
						</tr>
					<% 
					} 
					%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>			
				<br/>
				<p>
				Total: <span style="font-size: x-large; color: red;"><%= total(cart) %> &#8364;</span>
				</p>
				<!--Stampo quindi cosa è presente nel mio carrello e il relativo costo -->
				<%
				if ( cart.getNumberOfTickets() > 0 ) {
				%>
					<br/>
					<a href="?empty=ok">Remove all items from the cart</a>
					<form action="Finalize">
						<input type="submit" name="finalizza" value="Finalizza Ordine"/>
					</form>
                    <!--Tramite un form con action = Finalize , posso inserire il tasto che eventualmente rigira alla servlet la gestione
                    della finalizzazione degli ordini-->
				<%
				}
				%>
			</div>
		
			<div class="clear">
				<p>&nbsp;</p>
			</div>
			
		</div>
			
			
	
	</body>
</html>