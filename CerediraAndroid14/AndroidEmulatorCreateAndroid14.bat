@echo off

cd /d "%~dp0"

chcp 65001>nul

title %~n0

set "JAVA_HOME=%cd%\bin\OpenJDK17"
set "ANDROID_HOME=%cd%\bin\android\sdk"
set "PATH=%ANDROID_HOME%\cmdline-tools\12.0\bin;%ANDROID_HOME%\emulator;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\emulator;%PATH%"

set "ANDROID_USER_HOME=%cd%\var\android"
set "ANDROID_EMULATOR_HOME=%cd%\var\android"
set "ANDROID_AVD_HOME=%cd%\var\android\avd"

call avdmanager create avd --name ANDROID14 --force --abi google_apis/x86_64 --package "system-images;android-34;google_apis;x86_64" --device "pixel_6"

pause