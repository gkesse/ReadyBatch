@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
setlocal enabledelayedexpansion
    call GPrint :Print "[ GPrint ] Bonjour tout le monde"
endlocal
goto :eof
::===============================================
