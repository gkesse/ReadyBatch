@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Init
    set m_GConfigDataMapKeys=
goto :eof
::===============================================
:SetData
setlocal enabledelayedexpansion
    set lKey=%1
    set lValue=%2
endlocal && (
    set m_GConfigDataMap[%lKey%]=%lValue%
    set m_GConfigDataMapKeys=%m_GConfigDataMapKeys% %lKey%)
goto :eof
::===============================================
:GetData
setlocal enabledelayedexpansion
    set lKey=%1
    set lValue=!m_GConfigDataMap[%lKey%]!
endlocal && (
    set %2=%lValue%)
goto :eof
::===============================================
:ShowData
setlocal enabledelayedexpansion
    for %%K in (%m_GConfigDataMapKeys%) do echo %%K = !m_GConfigDataMap[%%K]!
endlocal
goto :eof
::===============================================
