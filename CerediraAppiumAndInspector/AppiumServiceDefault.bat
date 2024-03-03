@echo off

cd /d "%~dp0"

chcp 65001>nul

title %~n0

set "NODE_HOME=%cd%\bin\NodeJS"
set "APPIUM_HOME=%cd%\bin\appium"

set "PATH=%APPIUM_HOME%\node_modules\.bin;%NODE_HOME%;%PATH%"

cmd.exe /k "appium server"