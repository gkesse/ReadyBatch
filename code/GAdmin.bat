@echo off 
::===============================================
call GConfig :Init
call GOptions :GetArgs %*
call GConfig :ShowData
::call GProcess :Run
::===============================================
