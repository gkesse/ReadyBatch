@echo off 
::===============================================
set GCONFIG_KEY_MAP=
set GCONFIG_DATA_MAP=
::===============================================
call %*
goto :eof
::===============================================
:SetData
    set lKey=%~1
    set lValue=%~2
    set GCONFIG_DATA_MAP[%lKey%]=%lValue%
    set GCONFIG_KEY_MAP=%GCONFIG_KEY_MAP% %lKey%
goto :eof
::===============================================
:GetData
setlocal enabledelayedexpansion
    set lKey=%1
    set lValue=!GCONFIG_DATA_MAP[%lKey%]!
endlocal & (
    set %2=%lValue%
)
goto :eof
::===============================================
:ShowData
setlocal enabledelayedexpansion
    for %%K in (%GCONFIG_KEY_MAP%) do (
        echo %%K = !GCONFIG_DATA_MAP[%%K]!
    ) 
    echo.
endlocal
goto :eof
::===============================================
