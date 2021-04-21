@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Load
    call :Clear
    call :Query "select config_value from config_data ("
    call :Query "where config_key = '%1'"
    call :Run
goto :eof
::===============================================
:Save

goto :eof
::===============================================
:Insert
    call :Clear
    call :Query "insert into config_data"
    call :Query "values (config_key, config_value)"
    call :Query "('%1', '%2')"
    call :Run
goto :eof
::===============================================
