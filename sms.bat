@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
set "DEL=%%a"
)
Title SMS UNKNOWN
call :colorEcho f4 "SMS UNKNOWN"
echo.
call :colorecho 2 "Mr-Banana_2045"
echo.
echo.
set /P NUMBER= type number target: 
set /P MESSAGE= type your message: 
curl -X POST https://textbelt.com/text \
    --data-urlencode phone='%NUMBER%' \
    --data-urlencode message='%MESSAGE%' \
    -d key=textbelt
if errorlevel 1 (
    call :colorEcho 4 error !
) else (
    call :colorEcho 2 send your sms number %NUMBER%
)
pause
exit
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i