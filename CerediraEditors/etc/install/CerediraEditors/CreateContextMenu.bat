@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..\) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

rem Получаем имя текущего каталога исходя из каталога запуска данного скрипта
for %%i in (.) do set current_folder_path=%%~nxi
echo Текущий каталог: %current_folder_path%


set "root=HKEY_CURRENT_USER\SOFTWARE\Classes\Directory\Background\shell\%current_folder_path%"

reg query "%root%" /s >nul 2>&1
if %errorlevel% equ 0 (
	echo Удаление каталога %current_folder_path% из контекстного меню
    reg delete "%root%" /f
)

rem Корневой каталог
reg add "%root%" /v MUIVerb /t REG_SZ /d "%current_folder_path%" /f
reg add "%root%" /v SubCommands /t REG_SZ /f
reg add "%root%" /v Icon /t REG_SZ /d "%SystemRoot%\SystemResources\imageres.dll.mun,3" /f



call :CreateApp "%root%" "Notepad++" "Notepad++" "%ceredira_path%\Notepad++.bat" "%ceredira_path%\bin\Notepad++\Notepad++.exe"
call :CreateApp "%root%" "SublimeText4" "SublimeText4" "%ceredira_path%\SublimeText4.bat" "%ceredira_path%\bin\SublimeText4\sublime_text.exe"
call :CreateApp "%root%" "WinMerge" "WinMerge" "%ceredira_path%\WinMerge.bat" "%ceredira_path%\bin\WinMerge\WinMergeU.exe"

pause

exit /b 0


:CreateApp

set "localRoot=%~1"
set "appName=%~2"
set "appLabel=%~3"
set "appPath=%~4"
set "icon=%~5"

echo Создания ярлыка для %appName%

reg add "%localRoot%\shell\%appName%" /v MUIVerb /t REG_SZ /d "%appLabel%" /f
reg add "%localRoot%\shell\%appName%" /v Icon /t REG_SZ /d "\"%icon%\",0" /f
reg add "%localRoot%\shell\%appName%\command" /ve /t REG_SZ /d "\"%appPath%\"" /f

exit /b 0