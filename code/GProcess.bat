@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
setlocal enabledelayedexpansion
    call GConfig :GetData PROCESS lKey
    if "%lKey%" == "PRINT" ( call GProcessPrint :Run
    ) else ( if "%lKey%" == "CONFIG" ( call GProcessConfig :Run
    ) else ( if "%lKey%" == "FILE" ( call GProcessFile :Run
    ) else ( call GProcessPrint :Run )))
endlocal
goto :eof
::===============================================
