@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    set "G_STATE=S_INIT"   
:RunLoop
    if "%G_STATE%" == "S_INIT" ( goto Init %*
    ) else ( if "%G_STATE%" == "S_METHOD" ( goto Method %*
    ) else ( if "%G_STATE%" == "S_CHOICE" ( goto Method %*
    ) else ( if "%G_STATE%" == "S_SQLITE" ( goto Method %*
    ) else ( if "%G_STATE%" == "S_SAVE" ( goto Method %*
    ) else ( if "%G_STATE%" == "S_LOAD" ( goto Method %*
    ) else ( goto :eof ))))))
goto :RunLoop
::===============================================
:Init
    echo Init...
    set "G_STATE=S_METHOD"
goto :RunLoop
::===============================================
:Method
    echo Method...
    set "G_STATE=S_END"
goto :RunLoop
::===============================================
