<%@ page session="true"%>
<html>
   <head>
		<!--  <meta http-equiv="Refresh" content= "2; URL=index.jsp"/>-->
      <title>Start Web Application</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
   </head>
   
   <body>
   		<form action="j1.jsp" method="post">
   			
   			<textarea id="textField" name="textField" rows="1" cols="50" maxlength="1000"></textArea>
   			<input type="submit" value="Invia" hidden=true>
   		</form>
 	 	<script>
        document.getElementById('textField').addEventListener('input', function() {
            var inputText = this.value;
            if (inputText.includes('£') || inputText.length >= 1000) {
                this.form.submit();
            }
        });
    </script>    
    </body>
</html>

