<!-- import di classi Java -->
<%@ page import = "esame.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "com.google.gson.Gson"%>

<% 
    String text = (String) request.getParameter("text");
    Gson g = new Gson();
    char[] chars = text.toCharArray();
    int counter = 0;
    for (char c : chars){
        if (c <= 'Z' && c >= 'A'){
            counter++;
        }
    }
    Response resp = new Response(counter, text);
    String jesonite = g.toJson(resp);

%>