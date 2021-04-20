@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    call GConfig :GetData PROCESS lKeyIn
    call GString :ToUpper "%lKeyIn%" lKey
    if "%lKey%" == "PRINT" ( goto GProcessPrint
    ) else ( if "%lKey%" == "CONFIG" ( goto GProcessConfig
    ) else ( if "%lKey%" == "FILE" ( goto GProcessFile
    ) else ( if "%lKey%" == "TEST" ( goto GProcessTest
    ) else ( goto GProcessPrint ))))
goto :eof
::===============================================
:GProcessPrint
    call GProcessPrint :Run
goto :eof
::===============================================
:GProcessConfig
    call GProcessConfig :Run
goto :eof
::===============================================
:GProcessFile
    call GProcessFile :Run
goto :eof
::===============================================
:GProcessTest
    call GProcessTest :Run
goto :eof
::===============================================
