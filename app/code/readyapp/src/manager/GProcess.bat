@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
    set "lKey=test"
    if not "%1" == "" ( set "lKey=%~1" )
    if "%lKey%" == "test" ( goto Test %*
    ) else ( if "%lKey%" == "ui" ( goto Ui %*
    ) else ( goto Test  %* ))
goto :eof
::===============================================
:Test
    echo Test
goto :eof
::===============================================
:Ui
    call manager\GProcessUi :Run %*
goto :eof
::===============================================
