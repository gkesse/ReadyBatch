@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    set "G_STATE=S_INIT"   
:RunLoop
    if "%G_STATE%" == "S_ADMIN" ( goto ADMIN %*
    ) else ( if "%G_STATE%" == "S_INIT" ( goto INIT %*
    ) else ( if "%G_STATE%" == "S_METHOD" ( goto METHOD %*
    ) else ( if "%G_STATE%" == "S_CHOICE" ( goto CHOICE %*
    ) else ( if "%G_STATE%" == "S_SHOW_VERSION" ( goto SHOW_VERSION %*
    ) else ( if "%G_STATE%" == "S_SHOW_TABLES" ( goto SHOW_TABLES %*
    ) else ( if "%G_STATE%" == "S_CONFIG_DATA_SHOW_DATA" ( goto CONFIG_DATA_SHOW_DATA %*
    ) else ( if "%G_STATE%" == "S_SAVE" ( goto SAVE %*
    ) else ( if "%G_STATE%" == "S_LOAD" ( goto LOAD %*
    ) else ( if "%G_STATE%" == "S_QUIT" ( goto QUIT %*
    ) else ( goto :eof 
    ))))))))))
goto :RunLoop
::===============================================
:ADMIN
    call manager\GProcessUi :Run %*
    set "G_STATE=S_END"
goto :RunLoop
::===============================================
:INIT
    printf "\n"
    printf "SQLITE !!!\n"
    printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
    printf "\t%%-2s : %%s\n" "-i" "reinitialiser l'application"
    printf "\t%%-2s : %%s\n" "-v" "valider les configurations"
    printf "\t%%-2s : %%s\n" "-a" "redemarrer l'application"
    printf "\n"
    set "G_STATE=S_LOAD"
goto :RunLoop
::===============================================
:METHOD
    printf "SQLITE :\n"
    printf "\t%%-2s : %%s\n" "1" "afficher la version"
    printf "\t%%-2s : %%s\n" "2" "afficher les tables"
    printf "\t%%-2s : %%s\n" "3" "afficher la table config_data"
    printf "\n"
    set "G_STATE=S_CHOICE"
goto :RunLoop
::===============================================
:CHOICE
    set "lAnswer="
    set /p lAnswer="SQLITE (%G_SQLITE_ID%) ? "
    if "%lAnswer%" == "" ( set "lAnswer=%G_SQLITE_ID%" )
    if "%lAnswer%" == "-q" ( set "G_STATE=S_END" 
    ) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN" 
    ) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_SHOW_VERSION" && set "G_SQLITE_ID=%lAnswer%" 
    ) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_SHOW_TABLES" && set "G_SQLITE_ID=%lAnswer%" 
    ) else ( if "%lAnswer%" == "3" ( set "G_STATE=S_CONFIG_DATA_SHOW_DATA" && set "G_SQLITE_ID=%lAnswer%" 
    )))))
goto :RunLoop
::===============================================
:SHOW_VERSION
    printf "\n"
    call manager\GSQLite :Version
    call manager\GConfig :Insert "MODULE" "HELLO"
    set "G_STATE=S_SAVE"
goto :RunLoop
::===============================================
:SHOW_TABLES
    printf "\n"
    call manager\GSQLite :Clear
    call manager\GSQLite :Query "select name from sqlite_master"
    call manager\GSQLite :Run > %GTMP_FILE_02%
    call manager\GSQLite :Show 1 30
    set "G_STATE=S_SAVE"
goto :RunLoop
::===============================================
:CONFIG_DATA_SHOW_DATA
    printf "\n"

    call manager\GSQLite :Clear
    call manager\GSQLite :Query "select * from config_data"
    call manager\GSQLite :Run > %GTMP_FILE_02%
    call manager\GSQLite :Show 2 20 30
    set "G_STATE=S_SAVE"
goto :RunLoop
::===============================================
:SAVE
    set "G_STATE=S_QUIT"
goto :RunLoop
::===============================================
:LOAD
    set "G_STATE=S_METHOD"
goto :RunLoop
::===============================================
:QUIT
    printf "\n"
    set "lAnswer="
    set /p lAnswer="BATCH_QUIT (Oui/[N]on) ? "
    if "%lAnswer%" == "-q" ( set "G_STATE=S_END" 
    ) else ( if "%lAnswer%" == "-o" ( set "G_STATE=S_END"
    ) else ( if "%lAnswer%" == "-i" ( set "G_STATE=S_INIT"
    ) else ( if "%lAnswer%" == "n" ( set "G_STATE=S_INIT"
    ) else ( if "%lAnswer%" == "" ( set "G_STATE=S_INIT"
    ) else ( if "%lAnswer%" == "-a" ( set "G_STATE=S_ADMIN"
    ))))))
goto :RunLoop
::===============================================
