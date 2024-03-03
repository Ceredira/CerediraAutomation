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

echo Welcome to Android Cmd!
echo.
echo Example commands for sdkmanager:
echo     Help: sdkmanager --help
echo     List of available packages: sdkmanager --list
echo     List of installe packages: sdkmanager --list_installed
echo     Install specific platform: sdkmanager --install "platforms;android-34-ext10"
echo     Install specific system-image: sdkmanager --install "system-images;android-34;google_apis;x86_64"
echo.
echo Example commands for avdmanager:
echo     Help: avdmanager --help
echo     List of existing Android Virtual Devices: avdmanager list avd
echo     List of existing targets: avdmanager list target
echo     List of existing devices: avdmanager list device
echo     Create virtual device: avdmanager create avd --name ANDROID_14 --force --abi google_apis/x86_64 --package "system-images;android-34;google_apis;x86_64" --device "pixel_6"
echo     Delete virtual device: avdmanager delete avd --name ANDROID_14
echo.
echo Example commands for emulator:
echo     Help: emulator --help
echo     List of available AVDs: emulator.exe -list-avds
echo     Run emulator: emulator.exe @ANDROID_14
echo     Run emulator with logging: emulator.exe @ANDROID_14 -verbose
echo     Run emulator with gpu: emulator.exe @ANDROID_14 -gpu on
echo     Run emulator with VM acceleration: emulator.exe @ANDROID_14 -accel on
echo     Run emulator without sound: emulator.exe @ANDROID_14 -no-audio
echo.
echo Additional info available at: https://developer.android.com/studio/run/emulator-commandline


cmd.exe /k cd /d "%cd%"