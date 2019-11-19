@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    call GConfig :GetData PROCESS lKeyIn
    call GString :ToUpper "%lKeyIn%" lKey
    if "%lKey%" == "PRINT" ( call GProcessPrint :Run
    ) else ( if "%lKey%" == "CONFIG" ( call GProcessConfig :Run
    ) else ( if "%lKey%" == "FILE" ( call GProcessFile :Run
    ) else ( if "%lKey%" == "TEST" ( call GProcessTest :Run
    ) else ( call GProcessPrint :Run ))))
goto :eof
::===============================================
