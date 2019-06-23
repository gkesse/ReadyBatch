@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
setlocal enabledelayedexpansion
    echo [ GFile ] Start
    call GFile :Exist data/config/config.txt2
endlocal
goto :eof
::===============================================
