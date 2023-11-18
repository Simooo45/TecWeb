@echo off
setlocal enabledelayedexpansion

set "currentDir=%CD%"
echo Percorso corrente: %currentDir%
cd /D C:\TecWeb\Tomcat\apache-tomcat-9.0.22\bin
startup.bat
cd !currentDir!

endlocal