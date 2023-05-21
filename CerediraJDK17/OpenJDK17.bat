@echo off

cd /d "%~dp0"

title OpenJDK17
chcp 65001>nul

set "PATH=%cd%\bin\OpenJDK17\bin;%PATH%"
set "PATH=%cd%\bin\apache-maven-3\bin;%PATH%"
set "JAVA_HOME=%cd%\bin\OpenJDK17"

cmd.exe /k cd /d "%cd%"