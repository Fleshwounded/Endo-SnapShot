@echo off
@echo ----------------------------------------------------------------------------
@echo ---------- +++++++++++++++++++++++++++++++++++++++++++++++++++++ -----------
@echo ---------- + !EndoV2.5 semi-Automated Windows Snapshot Loader! + -----------
@echo ---------- +++++++++++++++++++++++++++++++++++++++++++++++++++++ -----------
@echo ----------------------------------------------------------------------------
@echo                                     /\
@echo                            +++++++++++++++++++++
@echo ---------------------------+ PERFORMING CHECKS +----------------------------
@echo                            +++++++++++++++++++++
@echo 
@echo                            +++++++++++++++++++++
@echo ---------------------------+ Loader Ver-0.9.0  +----------------------------
@echo                            +++++++++++++++++++++
@echo                                     \/
@echo .
@echo .
@echo .
@cd "%appdata%\endocoinV2"
@if %ERRORLEVEL% == 0 (echo DEFAULT EndoV2.5 DATA DIRECTORY DETECTED!&&pause&&goto :yes)
@if %ERRORLEVEL% == 1 (echo FAILED TO LOCATE DEFAULT DATA DIRECTORY!&&pause&&goto :drmk)
:yes
@echo ----------------------------------------------------------------------------
@echo ----------"YES SELECTION | Loader will use default data directory"----------
@echo ----------------------------------------------------------------------------&&pause&&pause
if not exist "%appdata%\endocoinV2" mkdir "%appdata%\endocoinV2"
@echo Defaulting and executing commands&&"%~dp0\bin\win32data\default.bat"
:no
@echo -----------------------------------------------------------------------------
@echo ------"NO SELECTION | Loader cannot continue without data directory!"  ------
@echo -----------------------------------------------------------------------------&&pause&&pause&&exit /b 0
:drmk
@echo .
@echo .
@echo .
@echo --------------------------------------------------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo ------------------------- + !ATTENTION! + --------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo --------------------------------------------------------------------
@echo -------------- ++++++++++++++++++++++++++++++++++++++++ ------------
@echo -------------- + Snapshot Loader failed to locate a   + ------------
@echo -------------- + data directory for EndoV2.5, you     + ------------
@echo -------------- + must create one.                     + ------------
@echo -------------- ++++++++++++++++++++++++++++++++++++++++ ------------
@echo --------------------------------------------------------------------
SET /P ANSWER_2="Do you wish to Create a data directory? (Y/N)"
echo You chose: "%ANSWER_2%"
if /i {%ANSWER_2%}=={y} (goto :yes)
if /i {%ANSWER_2%}=={Y} (goto :yes)
if /i {%ANSWER_2%}=={yes} (goto :yes)
if /i {%ANSWER_2%}=={Yes} (goto :yes)
if /i {%ANSWER_2%}=={n} (goto :no)
if /i {%ANSWER_2%}=={N} (goto :no)
if /i {%ANSWER_2%}=={no} (goto :no)
if /i {%ANSWER_2%}=={No} (goto :no)
if /i {%ANSWER_2%}=={} (goto :drskpfl)
goto :drskpfl
:drskpfl
@echo -----------------------------------------------------------------------------
@echo --------"INVALID SELECTION | Please choose ----> (Yes) OR (No) (Y/N)"--------
@echo -----------------------------------------------------------------------------&&pause&&pause&&goto :drskp
