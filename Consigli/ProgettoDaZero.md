INIZIO
------
Importare su eclipse il file "TemplateProgetto" (MASSIMA ATTENZIONE A NON MODIFICARE I TEMPLATE!) 

FILE ANT
--------
Il file build.xml contiene le informazioni per la creazione del WAR (Web ARchive), alcune cose sono da modificare
-> Nella parte iniziale va modificateo 'name="PROGETTO"' con il nome dell'applicazione
-> I targets dovrebbero essere generici, possono essere lasciati invariati

FILE WEB
--------
web > WEB-INF > web.xml è da modificare! In particolare:
-> Modificare display-name
-> Modificare i nomi delle servlet e associarli al giusto path
-> Modificare eventualmente la welcome page e error-page