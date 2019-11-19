@echo off 
::===============================================
call GConfig :Init
call GOptions :GetArgs %*
call GProcess :Run
::===============================================
