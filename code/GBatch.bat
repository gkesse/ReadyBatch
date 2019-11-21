@echo off 
::===============================================
set "GBATCH_TEST_MAP="
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;CharScape"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;CommandMultiLine"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;EchoScape"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;Comment"
::===============================================
call %*
goto :eof
::===============================================
:Test
    call GConfig :GetData OPTION_1 lOption1
    if "%lOption1%" == "number" ( goto TestNumber
    ) else ( if "%lOption1%" == "run" ( goto TestRun
    ) else ( if "%lOption1%" == "last" ( goto TestLast
    ) else ( if "%lOption1%" == "number" ( goto TestNumber
    ) else ( if "%lOption1%" == "all" ( goto TestAll
    ) else ( goto TestNumber )))))
goto :eof
::===============================================
:TestNumber
setlocal enabledelayedexpansion
    set /a lTestCount=0
    for %%A in (%GBATCH_TEST_MAP%) do ( 
        set /a lTestCount=!lTestCount! + 1
        echo !lTestCount! : %%A
    )
endlocal
goto :eof
::===============================================
:TestRun
    call GConfig :GetData OPTION_2 lOption2
setlocal enabledelayedexpansion
    set /a lTestCount=0
    for %%A in (%GBATCH_TEST_MAP%) do ( 
        set /a lTestCount=!lTestCount! + 1
        if "!lTestCount!" == "%lOption2%" ( goto %%A )
    )
endlocal
goto :eof
::===============================================
:TestLast
    call :TestCount lTestCount
    call GConfig :SetData OPTION_2 %lTestCount%
    call :TestRun
goto :eof
::===============================================
:TestAll
setlocal enabledelayedexpansion
    set /a lTestCount=0
    for %%A in (%GBATCH_TEST_MAP%) do ( 
        set /a lTestCount=!lTestCount! + 1
        call :%%A
        echo.
    )
endlocal
goto :eof
::===============================================
:TestCount
setlocal enabledelayedexpansion
    set /a lTestCount=0
    for %%A in (%GBATCH_TEST_MAP%) do ( 
        set /a lTestCount=!lTestCount! + 1
    )
endlocal & (
    set %1=%lTestCount%
)
goto :eof
::===============================================
:CharScape
    echo #------------------------------------------------
    echo ### CharScape
    echo #------------------------------------------------
    echo ^& ^| ^^ ^< ^> ^( ^) %%
goto :eof
::===============================================
:CommandMultiLine
    echo #------------------------------------------------
    echo ### CommandMultiLine
    echo #------------------------------------------------
echo Voici ^
une commande ^
multiligne
goto :eof
::===============================================
:EchoScape
    echo #------------------------------------------------
    echo ### EchoScape
    echo #------------------------------------------------
    echo.
    echo. /?  Print this help.
goto :eof
::===============================================
:Comment
    echo #------------------------------------------------
    echo ### Comment
    echo #------------------------------------------------
    :: Voici un commentaire
    rem Voici un commentaire
    echo Voici un commentaire
goto :eof
::===============================================
