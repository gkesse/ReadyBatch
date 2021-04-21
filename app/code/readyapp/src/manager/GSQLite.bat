@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Init
    :: drop
    call :Clear
    call :Query "drop table if exists config_data_o"
    call :Run
    :: config_data
    call :Clear
    call :Query "create table if not exists config_data ("
    call :Query "config_key text,"
    call :Query "config_value text"
    call :Query ")"
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
:Show
    if "%1" == "1" ( goto Show_C01 %*
    ) else ( if "%1" == "2" ( goto Show_C02 %*
    ))
goto :eof
::===============================================
:Show_C01
    ::sep
    printf "+-"
    for /l %%a in (1, 1, %2) do (
        printf "-"
    )
    printf "-+"
    printf "\n"
    :: data
    for /f "tokens=1* delims=|" %%a in (%GTMP_FILE_02%) do (
        printf "| "
        printf "%%-*s" %2 %%a
        printf " |"
        printf "\n"
    )
    ::sep
    printf "+-"
    for /l %%a in (1, 1, %2) do (
        printf "-"
    )
    printf "-+"
    printf "\n"
goto :eof
::===============================================
:Show_C02
    ::sep
    printf "+-"
    for /l %%a in (1, 1, 2) do (
        if not "%%a" == "1" ( printf "-+-" )
        if "%%a" == "1" (
            for /l %%b in (1, 1, %2) do (
                printf "-"
            )
        ) else (
            for /l %%b in (1, 1, %3) do (
                printf "-"
            )
        )
    )
    printf "-+"
    printf "\n"
    :: data
    for /f "tokens=1* delims=|" %%a in (%GTMP_FILE_02%) do (
        printf "| "
        printf "%%-*s" %2 %%a
        printf " | "
        printf "%%-*s" %3 %%b
        printf " |"
        printf "\n"
    )
    ::sep
    printf "+-"
    for /l %%a in (1, 1, 2) do (
        if not "%%a" == "1" ( printf "-+-" )
        if "%%a" == "1" (
            for /l %%b in (1, 1, %2) do (
                printf "-"
            )
        ) else (
            for /l %%b in (1, 1, %3) do (
                printf "-"
            )
        )
    )
    printf "-+"
    printf "\n"
goto :eof
::===============================================
