@echo off

chcp 65001 > nul

cd /d "%~dp0"

for %%i in (../../..) do set devopsat_path=%%~fxi
echo %devopsat_path%
echo %devopsat_path:\=/%

copy /y ".\bin\IntelliJIDEA\bin\idea.properties" "%devopsat_path%\bin\IntelliJIDEA\bin\"

mkdir "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\DontShowAgainFeedbackService.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\encoding.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\grazie_global.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\ide.general.local.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\ide.general.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\laf.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\settingsSync.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\shared-indexes.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\updates.xml" "%devopsat_path%\etc\IntelliJIDEA\options"
copy /y ".\etc\IntelliJIDEA\options\vcs.xml" "%devopsat_path%\etc\IntelliJIDEA\options"

mkdir "%devopsat_path%\var\IntelliJIDEA\grazie"
copy /y ".\var\IntelliJIDEA\grazie\ru-6.1.jar" "%devopsat_path%\var\IntelliJIDEA\grazie"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\options\git.xml').replace('C:\Ceredira2\CerediraAutomation', '%devopsat_path%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\options\git.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\options\jdk.table.xml').replace('C:/Ceredira2/CerediraAutomation', '%devopsat_path:\=/%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\options\jdk.table.xml'"

mkdir "%devopsat_path%\home\projects" > nul
powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\options\recentProjects.xml').replace('C:/Ceredira2/CerediraAutomation', '%devopsat_path:\=/%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\options\recentProjects.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\options\trusted-paths.xml').replace('C:\Users\unixshaman\IdeaProjects\MavenTestProject', '%devopsat_path%\home\projects') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\options\trusted-paths.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\options\project.default.xml').replace('C:\Ceredira2\CerediraAutomation', '%devopsat_path%').replace('C:/Ceredira2/CerediraAutomation', '%devopsat_path:\=/%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\options\project.default.xml'"

pause