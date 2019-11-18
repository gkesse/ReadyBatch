@echo off 
::===============================================
call %*
goto :eof
::===============================================
:ToUpper
setlocal enabledelayedexpansion
    set lString=%~1
    for %%L in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        set lString=!lString:%%L=%%L!
    )
endlocal & (
    set %2=%lString%
)
goto :eof
::===============================================
:ToLower
setlocal enabledelayedexpansion
    set lString=%~1
    for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
        set lString=!lString:%%L=%%L!
    )
endlocal & (
    set %2=%lString%
)
goto :eof
::===============================================
:Length
setlocal enabledelayedexpansion
    Set "lString=#%~1"
    Set "lLength=0"
    For %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
    if "!lString:~%%N,1!" neq "" (
    set /a "lLength+=%%N"
    set "lString=!lString:~%%N!"
    )
    )
endlocal & (
    set %~2=%lLength%
)
goto :eof
::===============================================

