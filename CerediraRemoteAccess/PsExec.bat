@echo off

cd /d "%~dp0"

title PsExec
chcp 65001>nul

cmd.exe /k cd /d "bin\PsExec"