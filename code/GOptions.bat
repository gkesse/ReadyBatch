@echo off 
::===============================================
call %*
goto :eof
::===============================================
:GetArgs
    call GString :ToUpper %1 lProcess
    
    call GConfig :SetData PROCESS %lProcess%
    call GConfig :SetData OPTION_1 %2
    call GConfig :SetData OPTION_2 %3
goto :eof
::===============================================
