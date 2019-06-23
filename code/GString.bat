@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Size
setlocal enabledelayedexpansion
    set lString=%1
    set lTmpFile=data/tmp/tmp.txt
    call GFile :Exist %lTmpFile%
    echo %lString%> %lTmpFile%
    for %%? in (%lTmpFile%) do ( set /a lSize=%%~z? - 2 )
endlocal & ( set %2=%lSize% )
goto :eof
::===============================================
