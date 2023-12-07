<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>


<!-- Creazione Bean con scope di applicazione -->
<jsp:useBean id = "utenti" class = "esame.GruppoUtenti" scope = "application"></jsp:useBean>

<!-- Prendere variabili da dispatcher -->
<%
	String username = (String) request.getParameter("username");
	String pwd = (String) request.getParameter("password");

	if (session.getAttribute("logged") == null){
        session.setAttribute("logged", false);
    } else if (username != null && pwd != null && utenti.exists(username)){
        session.setAttribute("logged", utenti.checkPassword(username, pwd));
    }
    else {
        session.setAttribute("logged", false);
    }
%>


<html>
    <head>
        <% if ((boolean) session.getAttribute("logged")) {%> 
            <meta http-equiv="Refresh" content= "4; URL=home.jsp"/>
        <% } else {%>
            <style>
	  	    body {
	  		    display: flex;
		        flex-direction: column;
		        align-items: center;
	  	    }
            input {
                width: 150px;
                margin: 2px;
            }
            .loginForm {
                margin: auto;
                border-radius: 25px 60px;
                border: 2px solid black;
                padding: 20px;
            }
            </style>
        <% } %>
        <title>Login page</title>
    </head>
    <body>
        <% if (!((boolean) session.getAttribute("logged"))){ %>
            <div class="loginForm">
		        <form action="login.jsp" method="post">
                    <label> Username: </label> <br>
                    <input type="text" name="username" value=<%= (username == null)? "" : username %>> <br>
                    <label> Password: </label> <br>
                    <input type="password" name="password"> <br> <br>
                    <input type="submit" value="Invia"> <br>
                    <input type="submit" formaction="admin.jsp" value="Entra come admin"> <br>
                    <input type="submit" formaction="register.jsp" value="Sei nuovo? registrati!"> <br>
                </form>
            </div>
            <% if (username != null || pwd != null) { %>
                    <br>
                    <text style="color:red;"> Username o password errati! </text> <br>
            <% } %>
        <% } else { %>
            <h3> Benvenuto <%= username %>! </h3> 
        <% } %>
    </body>
</html>