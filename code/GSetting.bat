@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Load
    set lFile=%1
    call GFile :Exist %lFile%
    for /f "eol=# tokens=1* delims== " %%A in (%lFile%) do (
        call GConfig :SetData %%A %%B
    )
    call GConfig :ShowData
goto :eof
::===============================================
