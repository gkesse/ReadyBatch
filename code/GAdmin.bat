@echo off 
::===============================================
echo.
::===============================================
call GConfig :Init
call GConfig :SetData PROCESS FILE
call GProcess :Run
::===============================================
echo.
::===============================================
