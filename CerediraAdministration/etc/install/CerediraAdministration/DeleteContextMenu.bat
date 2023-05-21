@echo off

chcp 65001>nul

cd /d %~dp0

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

pause