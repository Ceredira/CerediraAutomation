@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

rem Получаем имя текущего каталога исходя из каталога запуска данного скрипта
for %%i in (.) do set current_folder_path=%%~nxi
echo Текущий каталог: %current_folder_path%

rem Получаем имя текущего каталога исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..\.) do set root_name=%%~nxi
echo Имя корневого каталога: %root_name%
set "current_folder_path=%root_name%_%current_folder_path%"
echo Имя узла в контекстном меню: %current_folder_path%

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



call :CreateApp "%root%" "GitBash" "Git Bash" "%ceredira_path%\Git Bash.bat" "%ceredira_path%\bin\Git\git-bash.exe"
call :CreateApp "%root%" "GitGUI" "Git GUI" "%ceredira_path%\Git GUI.bat" "%ceredira_path%\bin\Git\cmd\git-gui.exe"
call :CreateApp "%root%" "SublimeMerge" "SublimeMerge" "%ceredira_path%\SublimeMerge.bat" "%ceredira_path%\bin\SublimeMerge\sublime_merge.exe"

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