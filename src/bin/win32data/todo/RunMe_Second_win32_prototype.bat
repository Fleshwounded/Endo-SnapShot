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
@echo ---------------------------+ Loader Ver-0.9.5  +----------------------------
@echo                            +++++++++++++++++++++
@echo                                     \/
@echo .
@echo .
@echo .
@cd "%appdata%\endocoinV2"
@if %ERRORLEVEL% == 0 (echo DEFAULT EndoV2.5 DATA DIRECTORY DETECTED!&&pause&&goto :drskp)
@if %ERRORLEVEL% == 1 (echo FAILED TO LOCATE DEFAULT DATA DIRECTORY!&&pause&&goto :drmk)
:create
@echo ----------------------------------------------------------------------------
@echo ----"CREATE SELECTION | You have selected create data directory option"-----
@echo ----------------------------------------------------------------------------&&pause&&pause
@echo Snapshot Loader will continue with creation options&&"%~dp0\bin\win32data\create.bat"
:specify
@echo ----------------------------------------------------------------------------
@echo ----"CREATE SELECTION | You have selected specify data directory option"-----
@echo ----------------------------------------------------------------------------&&pause&&pause
@echo Snapshot Loader will continue with specify options&&"%~dp0\bin\win32data\specify.bat"
:yes
@echo ----------------------------------------------------------------------------
@echo ----"YES SELECTION | Snapshot Loader will continue with default options"----
@echo ----------------------------------------------------------------------------&&pause&&pause
@echo Defaulting and executing commands&&"%~dp0\bin\win32data\default.bat"
:no
@echo -----------------------------------------------------------------------------
@echo ------"NO SELECTION | Snapshot Loader ignoring detected data directory"------
@echo -----------------------------------------------------------------------------&&pause&&pause&&goto :drmk
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
@echo -------------- + must specify or create one.          + ------------
@echo -------------- ++++++++++++++++++++++++++++++++++++++++ ------------
@echo --------------------------------------------------------------------
SET /P ANSWER="Do you wish to (S)pecify or (C)reate a data directory? (S/C)"
echo You chose: "%ANSWER%"
if /i {%ANSWER%}=={s} (goto :specify)
if /i {%ANSWER%}=={S} (goto :specify)
if /i {%ANSWER%}=={specify} (goto :specify)
if /i {%ANSWER%}=={Specify} (goto :specify)
if /i {%ANSWER%}=={c} (goto :create)
if /i {%ANSWER%}=={C} (goto :create)
if /i {%ANSWER%}=={create} (goto :create)
if /i {%ANSWER%}=={Create} (goto :create)
if /i {%ANSWER%}=={} (goto :drmkfl)
goto :drmkfl
:drmkfl
@echo -----------------------------------------------------------------------------
@echo ----"INVALID SELECTION | Please choose ----> (Specify) OR (Create) (S/C)"----
@echo -----------------------------------------------------------------------------&&pause&&pause&&goto :drmk
:drskp
@echo .
@echo .
@echo .
@echo --------------------------------------------------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo ------------------------- + !ATTENTION! + --------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo --------------------------------------------------------------------
SET /P ANSWER_2="Do you wish to use the detected (default) EndoV2.5 data directory? Yes or No (Y/N)"
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