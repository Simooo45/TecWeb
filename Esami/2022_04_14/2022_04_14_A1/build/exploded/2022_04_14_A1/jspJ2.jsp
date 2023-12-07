<%@ page session = "true"%>

<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.google.gson.Gson"%>
<%@ page import = "java.lang.reflect.Type"%>
<%@ page import = "com.google.gson.reflect.TypeToken"%>

<!-- Prendere variabili da dispatcher -->
<%
	String fileContent = (String) request.getParameter("fileContent").toLowerCase();
    String target = (String) request.getParameter("target").toLowerCase();
    if (fileContent != null && target != null){
        int count = 0;
        int index = text.indexOf(substring);

        while (index != -1) {
            count++;
            // Cerca l'occorrenza successiva
            index = text.indexOf(target, index + 1);
        }

        Result result = new Result(request.getParameter("fileContent"), request.getParameter("target"), count);
        request.setAttribute("result", Gson.toJson(result));
        getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);

    }
	
%>