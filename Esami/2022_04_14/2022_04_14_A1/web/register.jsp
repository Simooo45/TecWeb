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
    if (username == null){
        username = "";
    }
%>


<html>
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
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
    </head>
    <body>
        <div class="loginForm">
            <% if ((String) request.getParameter("firstTry") != null) {%>
                <text style="color:red"> Username non disponibile!</text><br>
            <% } %>
            <form action="RegisterServlet" method="post">
                    <label> Username: </label> <br>
                    <input type="text" id="username" name="username" value=<%= username %> > <br>
                    <label> Password: </label> <br>
                    <input type="password" id="password" name="password"> <br> 
                    <label> Conferma password: </label> <br>
                    <input type="password" id="reppassword" name="reppassword"> <br> <br>
                    <input type="submit" id="submitButton" value="Registrati" disabled="true"> <br>
                    <input type="submit" formaction="login.jsp" value="Torna al Login"> 
            </form>
        </div>
        <br>
        <text id="helpText" style="color:red"></text>
        <script>
            function listener(event) {
                var username =  document.getElementById("username");
                var pwd = document.getElementById("password");
                var rpwd = document.getElementById("reppassword");
                if (username.value.length < 4){
                    document.getElementById("helpText").innerHTML = "L'username deve avere almeno 4 caratteri!";
                    document.getElementById("helpText").style = "color:red";
                    document.getElementById('submitButton').disabled = true;
                } else if (pwd.value.length < 5){
                    document.getElementById("helpText").innerHTML = "La password deve avere almeno 5 caratteri!";
                    document.getElementById("helpText").style = "color:red";
                    document.getElementById('submitButton').disabled = true;
                }
                else if (pwd.value !== rpwd.value){
                    document.getElementById("helpText").innerHTML = "Le password non coincidono!";
                    document.getElementById("helpText").style = "color:red";
                    document.getElementById('submitButton').disabled = true;
                }
                else {
                    document.getElementById("helpText").innerHTML = "Registrati!";
                    document.getElementById("helpText").style = "color:green";
                    document.getElementById('submitButton').disabled = false;
                }
            }
            document.getElementById('username').addEventListener('input', listener);
            document.getElementById('password').addEventListener('input', listener);
            document.getElementById('reppassword').addEventListener('input', listener);
        </script>
        
    </body>
</html>