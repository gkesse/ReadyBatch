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
    ) else ( goto :eof ))))))
goto :RunLoop
::===============================================
:INIT
    echo INIT...
    set "G_STATE=S_LOAD"
goto :RunLoop
::===============================================
:METHOD
    echo METHOD...
    set "G_STATE=S_CHOICE"
goto :RunLoop
::===============================================
:CHOICE
    echo CHOICE...
    set "G_STATE=S_SQLITE"
goto :RunLoop
::===============================================
:SQLITE
    echo SQLITE...
    set "G_STATE=S_SAVE"
goto :RunLoop
::===============================================
:SAVE
    echo SAVE...
    set "G_STATE=S_END"
goto :RunLoop
::===============================================
:LOAD
    echo LOAD...
    set "G_STATE=S_METHOD"
goto :RunLoop
::===============================================
