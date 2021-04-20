@echo off 
::===============================================
call %*
goto :eof
::===============================================
:Run
setlocal enabledelayedexpansion
    call GConfig :SetData Nom KESSE
    call GConfig :SetData Prenom Gerard
    call GConfig :SetData Email gerard.kesse@readydev.com
    call GConfig :SetData Diplome Ingenieur
    call GConfig :SetData Formation Informatique Industrielle
    call GConfig :SetData Ecole Polytech'Montpellier
    call GConfig :ShowData
endlocal
goto :eof
::===============================================
