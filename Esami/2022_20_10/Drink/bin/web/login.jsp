<%@ page session="true"%>
<html>
   <head>
      <title>TW 16.6.2017 es1</title>
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
      	<form action="LogIn" method="post">
      		<p>User:</p>
      		<input type="text" name="userName" size="30"/><br>
      		<p>Password:</p>
      		<input type="password" name="pwd" size="30"/><br><br>
      		<input type="submit" value="Log In"/>
      	</form>
      </div>

   </body>
</html>