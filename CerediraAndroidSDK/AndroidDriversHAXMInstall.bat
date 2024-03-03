@echo off

cd /d "%~dp0"

chcp 65001>nul

title %~n0

call "%cd%\bin\android\sdk\extras\intel\Hardware_Accelerated_Execution_Manager\silent_install.bat"

pause