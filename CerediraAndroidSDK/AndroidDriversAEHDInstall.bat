@echo off

cd /d "%~dp0"

chcp 65001>nul

title %~n0

call "%cd%\bin\android\sdk\extras\google\Android_Emulator_Hypervisor_Driver\silent_install.bat"

pause