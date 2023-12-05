<%@ page application="true"%>
<html>
   <head>
      <title>TW 20.10.2022 es1</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
   </head>
   <body>

      <!-- 
       ...so we offer the user something to read, meanwhile.
      
      This is the first page being shown, while the JSF Servlet starts up the environment,
      upon the first reqeust.
      This message avoid letting the user linger without knowing what's going on.
      -->
 
      <p>
      	..Benvenuto, loggati... &nbsp;
      </p>
      <div>
	  	<%
		Integer result = (Integer)session.getAttribute("Tavolo");
      	if(result !=null)
		%>
      		<form action="LogIn" method="post">
      			<p>TAVOLO</p>
      			<input type="text" name="tavolo" size="30"/><br>
				<p>Nome</p>
      			<input type="text" name="nome" size="30"/><br>
      			<input type="submit" value="Vai Al tavolo!"/>
      		</form>
		
			<a href="/login.jsp" >Accedi</a>  

      	<%
		else{
		%>

		<%
		}
		%>
      	
      	Integer result = (Integer)session.getAttribute("success");
      	if(result !=null)
      	{
      		switch(result)
      		{
      			case 1:
      			{
      				%>
      					<p>Ordine finalizzato con <strong>successo</strong> da parte sua, si attendono gli altri elementi del gruppo</p>
      				<% 
      			}break;
      			
      			case 2:
      			{
      				%>
  					<p>Tutti gli elementi del gruppo hanno finalizzato l'ordine: Ordine finalizzato con <strong>successo</strong> </p>
  					<% 
      			}break;
      			case 3:
      			{
      				%>
  					<p>Admin: finalizzato ordine gruppo con <strong>successo</strong> </p>
  					<% 
      			}break;
      			
      			case 4:
      			{
      				%>
  					<p>Admin: Resettato ordine gruppo con <strong>successo</strong> </p>
  					<% 
      			}break;
      			
      			case 5:
      			{
      				%>
  					<p>Utente: il suo ordine � stato gestito dell'amministratore </p>
  					<% 
      			}break;
      		}
      		session.invalidate();
      	}
      	
      	%>
      </div>

   </body>
</html>