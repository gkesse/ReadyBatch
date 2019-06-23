@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Load
setlocal enabledelayedexpansion  
    set lFile=%1
    call GFile :Exist %lFile%
    for /f "eol=# tokens=*" %%A in (%lFile%) do (
        echo %%A
    )
endlocal
goto :eof
::===============================================
