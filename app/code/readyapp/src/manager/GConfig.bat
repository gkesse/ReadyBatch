@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Load
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "select config_value from config_data"
    call manager\GSQLite :Query "where config_key = '%1'"
    call manager\GSQLite :Run > %GTMP_FILE_02%
    set /p %~2=<%GTMP_FILE_02%
goto :eof
::===============================================
:Save
    call :Count %1 lCount
    if "%lCount%" == "0" ( call :Insert %*
    ) else ( call :Update %*
    )
goto :eof
::===============================================
:Count
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "select count(*) from config_data"
    call manager\GSQLite :Query "where config_key = '%1'"
    call manager\GSQLite :Run > %GTMP_FILE_02%
    set /p %~2=<%GTMP_FILE_02%
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
:Update
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "update config_data"
    call manager\GSQLite :Query "set config_value = '%2'"
    call manager\GSQLite :Query "where config_key = '%1'"
    call manager\GSQLite :Run
goto :eof
::===============================================
