@echo off 
::===============================================
call %*
goto :eof
::===============================================
:GetArgs   
    call GConfig :SetData PROCESS %1
    call GConfig :SetData OPTION_1 %2
    call GConfig :SetData OPTION_2 %3
goto :eof
::===============================================
