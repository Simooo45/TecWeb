@echo off
REM [Da posizionare nella cartella con il build.xml]

REM [Configurare il ant tra le variabili di ambiente prima di utilizzare, in caso di problemi cosnultare il seguente link]
REM [https://salesforce.stackexchange.com/questions/4386/the-term-ant-is-not-recognized-as-the-name-of-a-cmdlet-function-script-file]

call ant 05.build
call ant 09a.deploy.war
