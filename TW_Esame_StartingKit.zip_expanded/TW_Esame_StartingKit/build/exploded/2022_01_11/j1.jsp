<%@ page session="true"%>
<%@ page import="java.util.*"%>
<html>
   <head>
		<meta http-equiv="Refresh" content= "2; URL=paginaPrincipale"/>
      <title>Start Web Application</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
   </head>
   
   <body>
   		<%
   			char[] alfabeto = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'w', 'x', 'y', 'z'};
   			Random ran = new Random();
   		 	char ch = alfabeto[ran.nextInt(alfabeto.length)];
   			String text = (String) request.getAttribute("textField");
   			text.replaceAll(""+ch, "");
   		%>
   		<div>
   			Risultato parziale di J1, ottenuto eliminando il carattere <%=ch%>:
   			<textarea rows="4" cols="50"><%=text %></textarea>
   		</div>
   </body>
</html>
