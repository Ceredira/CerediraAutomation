@echo off

cd /d "%~dp0"

chcp 65001>nul

title %~n0

set "NODE_HOME=%cd%\bin\NodeJS"

set "PATH=%NODE_HOME%;%PATH%"

cmd.exe /k cd /d "%cd%"