<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.google.gson.Gson"%>

<!-- Prendere variabili da dispatcher -->
<%
	String textField = (String) request.getParameter("textField");
    if (request.getParameter("response") != null){

    } else if (textField != null){
        Gson g = new Gson();

        // Convertire l'oggetto in formato JSON
        String jsonString = new Gson().toJson(textField);

        // Impostare il tipo di contenuto della risposta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Scrivere il JSON nella risposta
        request.getSession().setParameter("jsonString", jsonString);

        if (getServletContext().getAttribute("richieste-totali") == null){
            getServletContext().setAttribute("richieste-totali", 1);
        }
        else
            getServletContext().setAttribute("richieste-totali", ((int) getServletContext().getAttribute("richieste-totali")) + 1);
        
        
        if (getServletContext().getAttribute("richieste-attuali")!= null && 
            (int) getServletContext().getAttribute("richieste-attuali") >= 3){
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/s1");
        dispatcher.forward(request, response);
    }
%>


<html>
  <body>
    <% if (request.getParameter("response") == null){ %>
        <label id="missingChar">Inserire 100 caratteri alfanumerici</label>
		<form action="home.jsp" method="post">
           	<textarea id="textField" name="textField" rows="5" cols="100" maxlength="1000"></textArea> <br>
           	<input type="submit" id="submitButton" value="Invia" disabled=true>
        </form>
        
        <script>
        	    document.getElementById('textField').addEventListener('input', function() {
                    var inputText = this.value;
                    if (inputText.match(/^$|^[0-9a-z]*$/i)){
                        if (inputText.length >= 100){
                            document.getElementById('submitButton').disabled = false;
                        }
                    }
                    else {
                        this.value = inputText.slice(0, -1);
                        document.getElementById('submitButton').disabled = true;
                        alert("Inserire solo lettere e numeri!");
                    }

                    if (this.value.length < 100){
                        document.getElementById('missingChar').innerHTML = "Scrivere ancora " + (100 - inputText.length) + " prima di inviare";
                        document.getElementById('submitButton').disabled = true;
                    }
                    else if (this.value.length >= 100){
                        document.getElementById('missingChar').innerHTML = "Hai scritto " + inputText.length + "/1000 caratteri";
                    }
        	     }
            );
        </script>
        <form action="admin.jsp" method="post">
            <input type="submit" value="Sono l'admin">
        </form>
        <% } else { 
            Response r = Gson.fromJson(request.getParameter("response"), Response.class); 
            %> 
            <label>Counter:</label> response.numero <br>
            <label>Text:</label> response.text <br>
        <% } %> 
  </body>
</html>