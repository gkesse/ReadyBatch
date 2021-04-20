@echo off 
::===============================================
set "GBATCH_TEST_MAP="
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;CharScape"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;CommandMultiLine"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;EchoScape"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;Comment"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;EnvironmentVariable"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;Variable"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;ShowAllVariableName"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;GString_SubStr"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;GString_SubStrStart"
set "GBATCH_TEST_MAP=%GBATCH_TEST_MAP%;GString_SelectFromLeft"
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
:EnvironmentVariable
    echo #------------------------------------------------
    echo ### EnvironmentVariable
    echo #------------------------------------------------
    echo AllUsersProfile : %AllUsersProfile%
    echo CD : %CD%
    echo CmdCmdLine : %CmdCmdLine%
    echo CmdExtVersion : %CmdExtVersion%
    echo CommonProgramFiles : %CommonProgramFiles%
    echo CommonProgramFiles(x86) : %CommonProgramFiles(x86)%
    echo CommonProgramW6432 : %CommonProgramW6432%
    echo ComputerName : %ComputerName%
    echo ComSpec : %ComSpec%
    echo Date : %Date%
    echo ErrorLevel : %ErrorLevel%
    echo FP_NO_HOST_CHECK : %FP_NO_HOST_CHECK%
    echo HighestNumaNodeNumber : %HighestNumaNodeNumber%
    echo HomeDrive : %HomeDrive%
    echo HomePath : %HomePath%
    echo LocalAppData : %LocalAppData%
    echo LogonServer : %LogonServer%
    echo Number_Of_Processors : %Number_Of_Processors%
    echo OS : %OS%
    echo Path : %Path%
    echo PathExt : %PathExt%
    echo Processor_Architecture : %Processor_Architecture%
    echo Processor_Identifier : %Processor_Identifier%
    echo Processor_Level : %Processor_Level%
    echo Processor_Revision : %Processor_Revision%
    echo ProgramData : %ProgramData%
    echo ProgramFiles : %ProgramFiles%
    echo ProgramFiles(x86) : %ProgramFiles(x86)%
    echo ProgramW6432 : %ProgramW6432%
    echo Prompt : %Prompt%
    echo PSModulePath : %PSModulePath%
    echo Public : %Public%
    echo Random : %Random%
    echo SessionName : %SessionName%
    echo SystemDrive : %SystemDrive%
    echo SystemRoot : %SystemRoot%
    echo Temp : %Temp%
    echo Time : %Time%
    echo Tmp : %Tmp%
    echo UserDomain : %UserDomain%
    echo UserName : %UserName%
    echo UserProfile : %UserProfile%
    echo WinDir : %WinDir%
goto :eof
::===============================================
:Variable
    echo #------------------------------------------------
    echo ### Variable
    echo #------------------------------------------------
    set lString="Je suis une chaine"
    set /a lNumber=100
    set /p lInput="Saisir une valeur au clavier ?: "
    set lUndefine=
    
    echo lString : %lString%
    echo lNumber : %lNumber%
    echo lInput : %lInput%
    echo lUndefine : %lUndefine%
goto :eof
::===============================================
:ShowAllVariableName
    echo #------------------------------------------------
    echo ### ShowAllVariableName
    echo #------------------------------------------------
    set
goto :eof
::===============================================
:GString_SubStr
    echo #------------------------------------------------
    echo ### GString_SubStr
    echo #------------------------------------------------
    set "lString=Bonjour tout le monde"
    set "lOutput=%lString:tout=TOUT%"
    echo lString : %lString%
    echo lOutput : %lOutput%
goto :eof
::===============================================
:GString_SubStrStart
    echo #------------------------------------------------
    echo ### GString_SubStrStart
    echo #------------------------------------------------
    set "lString=Bonjour tout le monde"
    set "lOutput=%lString:*r=Hello%"
    echo lString : %lString%
    echo lOutput : %lOutput%
goto :eof
::===============================================
:GString_SelectFromLeft
    echo #------------------------------------------------
    echo ### GString_SelectFromLeft
    echo #------------------------------------------------
    set "lString=Bonjour tout le monde"
    set "lOutput=%lString:~0,6%"
    echo lString : %lString%
    echo lOutput : %lOutput%
goto :eof
::===============================================
