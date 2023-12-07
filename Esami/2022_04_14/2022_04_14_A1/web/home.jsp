<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.google.gson.Gson"%>
<%@ page import = "java.lang.reflect.Type"%>
<%@ page import = "com.google.gson.reflect.TypeToken"%>


<html>
    <head>
		<title>Home</title> 
    </head>
    <body>
		<form action="ServletS1" method="post">
        <label for="textField2">Inserire la parola da cercare</label>
           	<input type="text" id="textField2" name="target" maxlength="100">
            <label for="textField">Inserire il nome di un file presente a lato Server (digitare € per inviare)</label>
           	<input type="text" id="textField" name="textField" maxlength="100"/>
           	<input type="submit" value="Invia" hidden=true>
        </form>
        <script>
        	   document.getElementById('textField').addEventListener('input', function() {
        		   var inputText = this.value;
        	     if (inputText.includes('€') || inputText.length >= 1000) {
        					 this.value = this.value.slice(0, -1) // Il carattere '€' non deve essere passato 
        	         this.form.submit();
        	     }
             });
        </script>
        <% if (request.getParameter("result") != null){
            String jsonString = (String) request.getParameter("result"); 
            Result result = (Result) Gson.fromJson(jsonString, Result.class); %>
            <label for="fileText">File in maiuscolo:</label>
            <textArea id="fileText" cols="50" rows="10" value=<% result.getFileContent() %> readonly></textArea> <br>
            <label for="targetText">Parola da cercare:</label>
            <text id="targetText" value=<% result.gettarget() %> readonly></text> <br>
            <label for="targetOcc">Occorrenze:</label>
            <text id="targetOcc" value=<% result.gettarget() %> readonly></text> <br>
        <% } %> 
    </body>
</html>