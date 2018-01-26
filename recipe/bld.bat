cd %SRC_DIR%

set SLN_FILE=giflib.sln
set SLN_CFG=Release
if "%ARCH%"=="32" (set SLN_PLAT=Win32) else (set SLN_PLAT=x64)
set PATH=%PATH%;C:\windows\Microsoft.NET\Framework\v4.0

rem wget http://www.chemformatter.com/build-with-visual-studio-2015/giflib/giflib-5.1.4-vs14.zip
appveyor DownloadFile http://www.chemformatter.com/build-with-visual-studio-2015/giflib/giflib-5.1.4-vs14.zip
7z x -o%SRC_DIR% -y giflib-5.1.4-vs14.zip vs2015
cd vs2015

REM Build step
MSBuild %SLN_FILE% /p:Configuration=Release,Platform=%SLN_PLAT%
if errorlevel 1 exit 1

copy %SRC_DIR%\vs2015\%SLN_PLAT%\Release\*.dll %LIBRARY_BIN%\
copy %SRC_DIR%\vs2015\%SLN_PLAT%\Release\*.exe %LIBRARY_BIN%\
copy %SRC_DIR%\vs2015\%SLN_PLAT%\Release\*.lib %LIBRARY_LIB%\
REM copy %SRC_DIR%\lib\%SLN_PLAT%\blitz.lib %LIBRARY_LIB%\