@echo off
setlocal enabledelayedexpansion
REM [Da posizionare nella cartella del progetto]

set "currentDir=%CD%"
echo Percorso corrente: %currentDir%
cd /D C:\TecWeb\Tomcat\apache-tomcat-9.0.22\bin
call startup.bat
cd /D !currentDir!
echo Tomcat started!

REM [Configurare il ant tra le variabili di ambiente prima di utilizzare, in caso di problemi cosnultare il seguente link]
REM [https://salesforce.stackexchange.com/questions/4386/the-term-ant-is-not-recognized-as-the-name-of-a-cmdlet-function-script-file]
cd !currentDir!\ant
call ant 05.build
call ant 09a.deploy.war
cd !currentDir!
for %%I in (.) do set "result=%%~nxI"
echo %result%
start chrome.exe http://localhost:8080/%result%/


endlocal