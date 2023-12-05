<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.AssociaArticoloServlet"%>
<%@ page import = "esame.Articolo"%>
<%@ page import = "esame.ListaArticoli"%>
<%@ page import = "java.util.*"%>


<jsp:useBean id = "listaArticoli" class = "esame.ListaArticoli" scope = "application"></jsp:useBean>

<!-- Prendere variabili da dispatcher -->
<%
	Articolo articolo = (Articolo) session.getAttribute("articolo");
	String prova = (String) getServletContext().getAttribute("prova");
%>


<html>
  <head>
  	  
  </head>
  <body>
		<% if (articolo == null){ %>
			<form action="associaArticoloServlet" method="post">
				<input type="text" id="nomeArticolo" name="nomeArticolo"  maxlength="64"></textArea>
				<input type="submit" value="Invia" hidden=true>
			</form>
			<script>
        	    document.getElementById('nomeArticolo').addEventListener('input', function() {
        			var inputText = this.value;
        	    	if (inputText.includes('%') || inputText.length >= 64) {
        				this.value = this.value.slice(0, -1) // Il carattere '%' non deve essere passato 
        	    	    this.form.submit();
        	    	}
            	});
        	</script>
		<% } else {%>
			<h1> Articolo "<%= articolo.getName() %>" </h1>
			<h2> in alternativa <%= listaArticoli.getArticle(articolo.getName()).getName()%>   </h2> 
		<% } %>
        
  </body>
</html>