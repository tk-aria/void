
where /Q cinst
if %ERRORLEVEL% == 0 (
    ECHO Success!
) else (
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
)

where /Q make
if %ERRORLEVEL% == 0 (
    ECHO Success!
) else (
    cinst --yes make
)

make setup
set SCRIPT_DIR=%~dp0
setx NAUDIO_WORKDIR %SCRIPT_DIR%

