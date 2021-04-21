@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    set "G_STATE=S_INIT"   
:RunLoop
    if "%G_STATE%" == "S_INIT" ( goto INIT %*
    ) else ( if "%G_STATE%" == "S_METHOD" ( goto METHOD %*
    ) else ( if "%G_STATE%" == "S_CHOICE" ( goto CHOICE %*
    ) else ( if "%G_STATE%" == "S_SQLITE" ( goto SQLITE %*
    ) else ( if "%G_STATE%" == "S_SAVE" ( goto SAVE %*
    ) else ( if "%G_STATE%" == "S_LOAD" ( goto LOAD %*
    ) else ( goto :eof 
    ))))))
goto :RunLoop
::===============================================
:INIT
    printf "\n"
    printf "ADMIN !!!\n"
    printf "\t%%-2s : %%s\n" "-q" "quitter l'application"
    printf "\n"
    set "G_STATE=S_LOAD"
goto :RunLoop
::===============================================
:METHOD
    printf "ADMIN :\n"
    printf "\t%%-2s : %%s\n" "1" "S_SQLITE"
    printf "\t%%-2s : %%s\n" "2" "S_STRING"
    printf "\n"
    set "G_STATE=S_CHOICE"
goto :RunLoop
::===============================================
:CHOICE
    set "lAnswer="
    set /p lAnswer="ADMIN (%G_ADMIN_ID%) ? "
    if "%lAnswer%" == "" ( set "lAnswer=%G_ADMIN_ID%" )
    if "%lAnswer%" == "-q" ( set "G_STATE=S_END" 
    ) else ( if "%lAnswer%" == "1" ( set "G_STATE=S_SQLITE" && set "G_ADMIN_ID=%lAnswer%" 
    ) else ( if "%lAnswer%" == "2" ( set "G_STATE=S_STRING" && set "G_ADMIN_ID=%lAnswer%" 
    )))
goto :RunLoop
::===============================================
:SQLITE
    call manager\GSQLiteUi :Run %*
    set "G_STATE=S_SAVE"
goto :RunLoop
::===============================================
:SAVE
    call manager\GConfig :Save G_ADMIN_ID %G_ADMIN_ID%
    set "G_STATE=S_END"
goto :RunLoop
::===============================================
:LOAD
    call manager\GConfig :Load G_ADMIN_ID G_ADMIN_ID
    set "G_STATE=S_METHOD"
goto :RunLoop
::===============================================
