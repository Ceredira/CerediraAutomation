@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\Git Bash.bat" /p
del "%ceredira_path%\Git GUI.bat" /p
del "%ceredira_path%\SublimeMerge.bat" /p

rmdir "%ceredira_path%\bin\Git" /s
rmdir "%ceredira_path%\bin\SublimeMerge" /s

rmdir "%ceredira_path%\etc\install\CerediraVersionControlGit" /s

rmdir "%ceredira_path%\man\CerediraVersionControlGit" /s

pause