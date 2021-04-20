@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Print
setlocal enabledelayedexpansion
    set lMessage=%1
    echo %lMessage%
endlocal
goto :eof
::===============================================
