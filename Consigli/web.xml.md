A cosa serve?
-------------
Il file `web.xml` contenuto in ogni progetto nel percorso `web > WEB-INF > web.xml` è un file che fornisce informazioni all'ant per la costruzione dell'applicazione web.  
Esso è strutturati in diverse sottoparti, come esempio verrà considerato il file presente nell'esercitazione 3b:  
- In quanto file xml vengono prima date le informazioni generali per interpretare correttamente il file durante il building:
    ```
    <?xml version="1.0" encoding="ISO-8859-1"?>

    <web-app xmlns="http://java.sun.com/xml/ns/j2ee"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
        version="2.4">
            ...
    </web-app>
    ```
- Dentro l'oggetto di tipo `<web-app>` vi è una parte che definisce le informazioni generali dell'applicazione, come nome e una breve descrizione:
    ```
        <display-name>03b_TecWeb_solved</display-name>
        <description>
          A JSP-based to project to use as a template for your own ones
        </description>
    ```
- In seguito vengono dichiarate le servlet e assieme ad esse anche la loro posizione ed eventuali parametri. Inoltre le servlet vengono poi mappate e ad ognuna deve essere assegnato un URL:
    ```
        <!-- Dichiarazione della servlet e dei suoi parametri -->
        <servlet>
            <servlet-name>StillAServlet</servlet-name>
            <servlet-class>it.unibo.tw.web.servlets.StillAServlet</servlet-class>
            <init-param>
            	<param-name>homeURL</param-name>
            	<param-value>/pages/home.jsp</param-value>
            </init-param>
        </servlet>

        <!-- La servlet viene mappata -->
        <servlet-mapping>
            <servlet-name>StillAServlet</servlet-name>
            <url-pattern>/stillAServlet</url-pattern>
        </servlet-mapping>
    ```
- Viene poi dichiarato il 'welcome file' ovvero la pagina che accoglie l'utente, di default il builder cerca index.htm o index.jsp:
    ```
        <welcome-file-list>
    		<welcome-file>index.jsp</welcome-file>
    	</welcome-file-list>
    ```
- Infine vengono poi assegnate le 'landing pages' ovvero le pagine che vengono caricate in presenza di determinati errori:
    ```
        <error-page>
    	    <error-code>404</error-code>
    	    <location>/errors/notfound.html</location>
        </error-page>
    ```


