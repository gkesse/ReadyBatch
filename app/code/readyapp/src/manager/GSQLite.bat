@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Init
    :: config_data
    call :Clear
    call :Query "create table if not exists config_data ("
    call :Query "config_key text,"
    call :Query "config_value text"
    call :Query ")"
    call :Run
    :: tables
    call :Clear
    call :Query "select * from sqlite_master"
    call :Run
goto :eof
::===============================================
:Version
    sqlite3 --version
goto :eof
::===============================================
:Clear
    printf "" > %GTMP_FILE_01%
goto :eof
::===============================================
:Query
    printf "%%s\n" %* >> %GTMP_FILE_01%
goto :eof
::===============================================
:Run
    sqlite3 %GSQLITE_DB_PATH% < %GTMP_FILE_01%
goto :eof
::===============================================
