@echo off
chcp 65001 > nul

cd /d "%~dp0"

rem Установка JAVA_HOME необходима, так как из дистрибутива IntelliJ IDEA для
rem уменьшения размера дистрибутива удален встроенный дистрибутив jbr.
rem Оригинальный дистрибутив jbr доступен в компоненте
rem CerediraJavaAutomationIDEAFull
set "JAVA_HOME=%cd%\bin\OpenJDK17"
echo %JAVA_HOME%

set "GIT_CONFIG_GLOBAL=%cd%\etc\git\.gitconfig"
echo %GIT_CONFIG_GLOBAL%

start /b "" "bin\IntelliJIDEA\bin\idea64.exe"