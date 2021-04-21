@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Load
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "select config_value from config_data ("
    call manager\GSQLite :Query "where config_key = '%1'"
    call manager\GSQLite :Run
goto :eof
::===============================================
:Save

goto :eof
::===============================================
:Insert
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "insert into config_data"
    call manager\GSQLite :Query "(config_key, config_value)"
    call manager\GSQLite :Query "values ('%1', '%2')"
    call manager\GSQLite :Run
goto :eof
::===============================================
