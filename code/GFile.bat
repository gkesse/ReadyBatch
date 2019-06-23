@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Exist
setlocal enabledelayedexpansion
    set lFile=%1
    if not exist %lFile% (
        echo [ GFile ] Error GFileExist: %lFile%
        goto :eof 
    )
endlocal
goto :eof
::===============================================
