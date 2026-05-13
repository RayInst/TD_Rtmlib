@echo off
setlocal
cd /d "%~dp0"

echo Searching for TouchDesigner shortcut...
set "LNK_FILE="
for /f "delims=" %%A in ('dir /s /b "C:\ProgramData\Microsoft\Windows\Start Menu\TouchDesigner*.lnk" 2^>nul') do set "LNK_FILE=%%A"
if not defined LNK_FILE (
    for /f "delims=" %%A in ('dir /s /b "%AppData%\Microsoft\Windows\Start Menu\TouchDesigner*.lnk" 2^>nul') do set "LNK_FILE=%%A"
)
if not defined LNK_FILE (
    for /f "delims=" %%A in ('dir /s /b "%Public%\Desktop\TouchDesigner*.lnk" 2^>nul') do set "LNK_FILE=%%A"
)
if not defined LNK_FILE (
    for /f "delims=" %%A in ('dir /s /b "%USERPROFILE%\Desktop\TouchDesigner*.lnk" 2^>nul') do set "LNK_FILE=%%A"
)

if not defined LNK_FILE (
    echo TouchDesigner shortcut not found.
    pause
    exit /b 1
)

set "TEMP_FILE=%TEMP%\td_target.txt"
if exist "%TEMP_FILE%" del "%TEMP_FILE%"
powershell -NoProfile -Command "$sh=New-Object -ComObject WScript.Shell;$sc=$sh.CreateShortcut('%LNK_FILE%');Write-Output $sc.TargetPath" > "%TEMP_FILE%"
set /p TD_EXE=<"%TEMP_FILE%"
del "%TEMP_FILE%"

for %%F in ("%TD_EXE%") do set "TD_DIR=%%~dpF"
set "TD_DIR=%TD_DIR:~0,-1%"
set PY=%TD_DIR%\python.exe

echo Found Python: %PY%

"%PY%" -m pip install --upgrade pip
"%PY%" -m pip install rtmlib  --no-deps
"%PY%" -m pip install tqdm
:: "%PY%" -m pip uninstall onnxruntime -y
"%PY%" -m pip install --no-cache-dir onnxruntime-gpu

echo.
echo Done. Place your .onnx models in ./models/
pause
