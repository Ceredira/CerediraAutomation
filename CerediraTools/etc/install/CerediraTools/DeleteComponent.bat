@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\LdapAdmin.bat" /p
del "%ceredira_path%\MultiCommander.bat" /p
del "%ceredira_path%\Nssm.bat" /p

rmdir "%ceredira_path%\bin\LdapAdmin" /s
rmdir "%ceredira_path%\bin\MultiCommander" /s
rmdir "%ceredira_path%\bin\Nssm" /s

rmdir "%ceredira_path%\etc\install\CerediraTools" /s

rmdir "%ceredira_path%\man\CerediraTools" /s

pause