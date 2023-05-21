@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\mRemoteNG.bat" /p
del "%ceredira_path%\PsExec.bat" /p
del "%ceredira_path%\Putty.bat" /p
del "%ceredira_path%\WinSCP.bat" /p

rmdir "%ceredira_path%\bin\mRemoteNG" /s
rmdir "%ceredira_path%\bin\PsExec" /s
rmdir "%ceredira_path%\bin\Putty" /s
rmdir "%ceredira_path%\bin\WinSCP" /s

rmdir "%ceredira_path%\etc\install\CerediraRemoteAccess" /s

rmdir "%ceredira_path%\man\CerediraRemoteAccess" /s

pause