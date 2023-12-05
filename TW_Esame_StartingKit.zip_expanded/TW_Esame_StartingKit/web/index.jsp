<%@ page session="true"%>
<%@ page import="java.util.*"%>
<html>
   <head>
		<!--  <meta http-equiv="Refresh" content= "2; URL=index.jsp"/>-->
      <title>Start Web Application</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
   </head>
   
   <body>
   		<form action="myFunction">
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
    	
    	<%
    		myFunction(){
			char[] alfabeto = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'w', 'x', 'y', 'z'};
			Random ran = new Random();
		 	char ch = alfabeto[ran.nextInt(alfabeto.length)];
			String text = (String) request.getAttribute("textField");
			text.replaceAll(""+ch, "");
			}
    	%>    
    </body>
</html>

