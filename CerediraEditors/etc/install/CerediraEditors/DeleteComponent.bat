@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\Notepad++.bat" /p
del "%ceredira_path%\SublimeText4.bat" /p
del "%ceredira_path%\WinMerge.bat" /p

rmdir "%ceredira_path%\bin\Notepad++" /s
rmdir "%ceredira_path%\bin\SublimeText4" /s
rmdir "%ceredira_path%\bin\WinMerge" /s

rmdir "%ceredira_path%\etc\install\CerediraEditors" /s

rmdir "%ceredira_path%\man\CerediraEditors" /s

pause