@echo off

chcp 65001>nul

cd /d %~dp0

rem Получаем корневой каталог исходя из каталога запуска данного скрипта
for %%i in (%~dp0\..\..\..) do set ceredira_path=%%~fxi
rem set ceredira_path=D:\Ceredira_*.*
echo Корневой каталог: %ceredira_path%

del "%ceredira_path%\KeePass.bat"
del "%ceredira_path%\FindAndReplace.bat"
del "%ceredira_path%\Everything.bat"
del "%ceredira_path%\etc\install\CerediraTools\version\1.0.0"
del "%ceredira_path%\etc\install\CerediraTools\DeleteContextMenu.bat"
rem Этот файл нельзя удалять, так как выполнение скрипта прервется
rem Необходимо удалять отдельными командами из инсталлятора или вручную
rem del "%ceredira_path%\etc\install\CerediraTools\DeleteComponent.bat"
del "%ceredira_path%\etc\install\CerediraTools\CreateContextMenu.bat"
del "%ceredira_path%\bin\KeePass\XSL\KDBX_Tabular_HTML.xsl"
del "%ceredira_path%\bin\KeePass\XSL\KDBX_PasswordsOnly_TXT.xsl"
del "%ceredira_path%\bin\KeePass\XSL\KDBX_DetailsLight_HTML.xsl"
del "%ceredira_path%\bin\KeePass\XSL\KDBX_DetailsFull_HTML.xsl"
del "%ceredira_path%\bin\KeePass\XSL\KDBX_Common.xsl"
del "%ceredira_path%\bin\KeePass\ShInstUtil.exe"
del "%ceredira_path%\bin\KeePass\README.md"
del "%ceredira_path%\bin\KeePass\License.txt"
del "%ceredira_path%\bin\KeePass\KeePassLibC64.dll"
del "%ceredira_path%\bin\KeePass\KeePassLibC32.dll"
del "%ceredira_path%\bin\KeePass\KeePass.XmlSerializers.dll"
del "%ceredira_path%\bin\KeePass\KeePass.exe.config"
del "%ceredira_path%\bin\KeePass\KeePass.exe"
del "%ceredira_path%\bin\KeePass\KeePass.chm"
del "%ceredira_path%\bin\FindAndReplace\README.md"
del "%ceredira_path%\bin\FindAndReplace\fnr.exe"
del "%ceredira_path%\bin\Everything\README.md"
del "%ceredira_path%\bin\Everything\Everything.lng"
del "%ceredira_path%\bin\Everything\Everything.exe"


rmdir "%ceredira_path%\etc\install\CerediraTools\version"
rem Этот каталог нельзя удалять, так как он не пустой
rem Необходимо удалять отдельными командами из инсталлятора или вручную
rem rmdir "%ceredira_path%\etc\install\CerediraTools"
rem rmdir "%ceredira_path%\etc\install"
rem rmdir "%ceredira_path%\etc"
rmdir "%ceredira_path%\bin\KeePass\XSL"
rmdir "%ceredira_path%\bin\KeePass\Plugins"
rmdir "%ceredira_path%\bin\KeePass\Languages"
rmdir "%ceredira_path%\bin\KeePass"
rmdir "%ceredira_path%\bin\FindAndReplace"
rmdir "%ceredira_path%\bin\Everything"
rem rmdir "%ceredira_path%\bin"

pause