# TecWeb

Repos contenente prove d'esame svolte e template/consigli per lo svolgimento dell'esame di Tecnologie Web

## Struttura

La repos contiene 3 sottocartelle con il seguente contenuto
### *Esami*

Contiene una serie di esami svolti. Le sottocartelle devono essere rinominate in funzione della data dell'esame con il format ***yyyy_mm_dd***. Dentro ogni esame si trovano 3 cartelle numerate da 1 a 3 che contengono l'esercizio svolto.

> [!WARNING]
> Ogni esercizio deve ***compilare*** prima di essere inserito nella repos.

### *Template*

Contiene una serie di file che possono offrire dei pattern utili e frequenti, si consiglia di mantenere i pattern più generici possibile a discrezione dell'autore.

> [!IMPORTANT]
> **Evidenziare** in maniera chiara le parti del template che vanno modificate, dando eventualmente suggerimenti commentati.

### *Consigli*

La cartella contiene dei file di testo con informazioni utili ai fini del superamento dell'esame, come pattern frequenti e come affrontare determinati tipi di richieste.

## Altre info

Si ricordi che ogni file di codice inserito deve essere **leggibile** e comprensibile anche da esterni, è buona norma commentare quanto meno le parti più ostiche degli esercizi per fornire una chiave di lettura.

> [!CAUTION]
> Per ottenere la massima compatibilità dei progetti è necessario **evitare path specifici cablati nel codice** di conseguenza, per avere un _ant>environment.properties_ unico e generico si consiglia di spostare i path in
> ``` 
> # JRE  
> jdk.home="C:\Program Files\Java\jdk-17.0.2"
> 
> # WebServer  
> server.home=C:\\TecWeb\\Tomcat\\apache-tomcat-9.0.22  
> deploy.path=${server.home}\\webapps
> ```
