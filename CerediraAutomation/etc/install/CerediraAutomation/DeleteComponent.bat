@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\7z File Manager.bat" /p

rmdir "%ceredira_path%\bin\7-Zip" /s

rmdir "%ceredira_path%\etc\install\CerediraAutomation" /s

rmdir "%ceredira_path%\man\CerediraAutomation" /s

pause