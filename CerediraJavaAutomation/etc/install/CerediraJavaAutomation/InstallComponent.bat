@echo off

chcp 65001 > nul

cd /d "%~dp0"

for %%i in (../../..) do set devopsat_path=%%~fxi
echo %devopsat_path%
echo %devopsat_path:\=/%

copy /y ".\etc\IntelliJIDEA\DontShowAgainFeedbackService.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\encoding.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\grazie_global.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\ide.general.local.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\laf.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\settingsSync.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\shared-indexes.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\updates.xml" "%devopsat_path%\etc\IntelliJIDEA\"
copy /y ".\etc\IntelliJIDEA\vcs.xml" "%devopsat_path%\var\IntelliJIDEA\"

copy /y ".\var\IntelliJIDEA\ru-6.0.jar" "%devopsat_path%\etc\IntelliJIDEA\"

copy /y ".\bin\IntelliJIDEA\bin\idea.properties" "%devopsat_path%\bin\IntelliJIDEA\bin\"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\git.xml').replace('C:\Ceredira2\CerediraAutomation', '%devopsat_path%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\git.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\jdk.table.xml').replace('C:/Ceredira2/CerediraAutomation', '%devopsat_path:\=/%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\jdk.table.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\trusted-paths.xml').replace('C:\Users\unixshaman\IdeaProjects\MavenTestProject', '%devopsat_path%\home\projects') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\trusted-paths.xml'"

powershell -command "(Get-Content -Raw '.\etc\IntelliJIDEA\project.default.xml').replace('C:\Ceredira2\CerediraAutomation', '%devopsat_path%').replace('C:/Ceredira2/CerediraAutomation', '%devopsat_path:\=/%') | Set-Content '%devopsat_path%\etc\IntelliJIDEA\project.default.xml'"

pause