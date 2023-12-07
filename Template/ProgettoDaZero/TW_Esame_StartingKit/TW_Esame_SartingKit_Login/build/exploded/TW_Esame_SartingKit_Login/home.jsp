<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.google.gson.Gson"%>
<%@ page import = "java.lang.reflect.Type"%>
<%@ page import = "com.google.gson.reflect.TypeToken"%>


<!-- Creazione Bean con scope di applicazione -->
<jsp:useBean id = "idBeanApplicazione" class = "package.BeanApplicazione" scope = "application"></jsp:useBean>
<!-- Creazione Bean con scope di sessione -->
<jsp:useBean id = "idBeanSessione" class = "package.BeanSessione" scope = "session"></jsp:useBean>

<!-- Prendere variabili da dispatcher -->
<%
	String var1 = (String) session.getAttribute("var1");
	String var2 = (String) session.getAttribute("var2");
	if(var1 == null)   var1 = "";
	if(var2 == null)   var2 = "";
%>


<html>
  <head>
			<!-- head --> 
  	  <script>
  	  </script>
  </head>
  <body>
		<!-- body -->
  </body>
</html>