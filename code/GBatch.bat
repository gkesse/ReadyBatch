@echo off 
::===============================================
set "GBATCH_TEST_MAP="
set "GBATCH_TEST_MAP=CharScape;%GBATCH_TEST_MAP%"
set "GBATCH_TEST_MAP=CharScape;%GBATCH_TEST_MAP%"
set "GBATCH_TEST_MAP=CharScape;%GBATCH_TEST_MAP%"
set "GBATCH_TEST_MAP=CharScape;%GBATCH_TEST_MAP%"
set "GBATCH_TEST_MAP=CharScape;%GBATCH_TEST_MAP%"
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
    ) else ( goto TestNumber ))))
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
    echo ^& ^| ^^ ^< ^> ^( ^)
goto :eof
::===============================================
