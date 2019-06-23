@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
setlocal enabledelayedexpansion
    call GSetting :Load data/config/config.txt
endlocal
goto :eof
::===============================================
