@echo off
::===============================================
set "PATH=C:\MinGW\bin;%PATH%"
set "PATH=C:\Users\Admin\Downloads\Programs\ReadyLib\dev\sqlite\3.29.0\mingw\bin;%PATH%"
set "PATH=C:\Users\Admin\Downloads\Compressed\coreutils-5.3.0-bin\bin;%PATH%"
set "PATH=C:\Users\Admin\Downloads\Compressed\coreutils-5.3.0-dep\bin;%PATH%" 
set "PATH=C:\Users\Admin\Downloads\Compressed\gawk-3.1.6-1-bin\bin;%PATH%"
::===============================================
set "GPROJECT_ROOT=C:\Users\Admin\Downloads\Programs"
set "GPROJECT_PATH=%GPROJECT_ROOT%\ReadyBatch"
set "GPROJECT_SRC=%GPROJECT_PATH%\app\code\readyapp\src"
set "GPROJECT_DATA=%GPROJECT_PATH%\data"
::===============================================
set "GSQLITE_DB_PATH=%GPROJECT_DATA%\sqlite\config.dat"
::===============================================
set "GTMP_FILE_01=%GPROJECT_DATA%\tmp\tmp_file_01.txt"
set "GTMP_FILE_02=%GPROJECT_DATA%\tmp\tmp_file_02.txt"
::===============================================
set "GGIT_URL=https://github.com/gkesse/ReadyBatch.git"
set "GGIT_NAME=ReadyBatch"
::===============================================
