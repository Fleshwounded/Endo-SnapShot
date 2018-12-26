@echo off
@echo .
@echo .
@echo .
@echo -----------------------------------------------
@echo ----- CREATING BACKUP OF WALLET DATA FILE -----
@echo -----------------------------------------------
if not exist "%appdata%\endocoinV2_V2_5_BAK" mkdir "%appdata%\endocoinV2_V2_5_BAK"
@echo .
@echo Created backup directory (appdata/endocoinV2_V2_5_BAK)
@echo .
if not exist "%appdata%\endocoinV2\wallet.dat" goto :noskp
xcopy /s /e /f /r /y "%appdata%\endocoinV2\wallet.dat" "%appdata%\endocoinV2_V2_5_BAK\wallet.dat*"
@echo .
@echo Created backup of wallet.dat in appdata/endocoinV2_V2_5_BAK
if not exist "%appdata%\endocoinV2\endocoin.conf" goto :nocfg
:cfgyn
@echo .
@echo .
@echo .
@echo --------------------------------------------------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo ------------------------- + !ATTENTION! + --------------------------
@echo ------------------------- +++++++++++++++ --------------------------
@echo --------------------------------------------------------------------
@echo -------------- ++++++++++++++++++++++++++++++++++++++++ ------------
@echo -------------- + Snapshot Loader has automatically    + ------------
@echo -------------- + detected that you already have a     + ------------
@echo -------------- + endocoin.conf file                   + ------------
@echo -------------- ++++++++++++++++++++++++++++++++++++++++ ------------
@echo --------------------------------------------------------------------
SET /P ANSWER_3=Do you wish to keep the current configuration file? (Y/N)
@echo You chose: "%ANSWER_3%"
if /i {%ANSWER_3%}=={y} (goto :yes)
if /i {%ANSWER_3%}=={Y} (goto :yes)
if /i {%ANSWER_3%}=={yes} (goto :yes)
if /i {%ANSWER_3%}=={Yes} (goto :yes)
if /i {%ANSWER_3%}=={n} (goto :no)
if /i {%ANSWER_3%}=={N} (goto :no)
if /i {%ANSWER_3%}=={no} (goto :no)
if /i {%ANSWER_3%}=={No} (goto :no)
if /i {%ANSWER_3%}=={} (goto :cfgfl)
goto :cfgfl
:cfgfl
@echo .
@echo .
@echo .
@echo ---------------------------------------------------------------------
@echo ----"INVALID SELECTION | Please choose ----> (Yes) OR (No) (Y/N)"----
@echo ---------------------------------------------------------------------&&pause&&pause&&goto :cfgyn
:yes
@echo .
xcopy /s /e /f /r /y "%appdata%\endocoinV2\endocoin.conf" "%appdata%\endocoinV2_V2_5_BAK\endocoin.conf*"
@echo .
@echo Created backup of endocoin.conf in appdata/endocoinV2_V2_5_BAK&&pause&&pause&&goto :noskp
:nocfg
@echo .
@echo No config file found in data directory
:no
@echo .
@echo Skipping config file backup&&pause&&pause
del /f /q "%appdata%\endocoinV2_V2_5_BAK\endocoin.conf"
:noskp
@echo .
@echo .
@echo .
@echo -----------------------------------------------
@echo ----- DELETING OLD DATA DIRECTORY CONTENT -----
@echo -----------------------------------------------
@echo .
del /f /q "%appdata%\endocoinV2"
@echo .
@echo Deleted old data directory
if not exist "%appdata%\endocoinV2" mkdir "%appdata%\endocoinV2"
@echo .
@echo Re-created data directory
@echo .
@echo .
@echo .
@echo -----------------------------------------------
@echo ---- LOADING SNAPSHOT AND BACKED UP FILES -----
@echo -----------------------------------------------
@echo .
if not exist "%appdata%\endocoinV2_V2_5_BAK\endocoin.conf" goto :nocfgtx
@echo .
xcopy /s /e /f /r /y "%appdata%\endocoinV2_V2_5_BAK\endocoin.conf" "%appdata%\endocoinV2\endocoin.conf*"
@echo .
@echo Copied backed up config file
:nocfgtx
if not exist "%appdata%\endocoinV2_V2_5_BAK\wallet.dat" goto :allskp
@echo .
xcopy /s /e /i /f /r /y "%appdata%\endocoinV2_V2_5_BAK\wallet.dat" "%appdata%\endocoinV2\wallet.dat*"
@echo .
@echo Copied backed up wallet data file
:allskp
@echo .
xcopy /s /e /i /f /r /y "%~dp0..\..\bin\chaindata\database" "%appdata%\endocoinV2\database"
@echo .
@echo Copied snapshot part 1 of 3
@echo .
xcopy /s /e /i /f /r /y "%~dp0..\..\bin\chaindata\txleveldb" "%appdata%\endocoinV2\txleveldb"
@echo .
@echo Copied snapshot part 2 of 3
@echo .
xcopy /s /e /i /f /r /y "%~dp0..\..\bin\chaindata\blk0001.dat" "%appdata%\endocoinV2\blk0001.dat*"
@echo .
@echo Copied snapshot part 3 of 3
@echo .
@echo --------------------------------------------------------------------------
@echo ------------------------- +++++++++++++++++++++ --------------------------
@echo ------------------------- + !CONGRADULATIONS! + --------------------------
@echo ------------------------- +++++++++++++++++++++ --------------------------
@echo --------------------------------------------------------------------------
@echo ---------------- ++++++++++++++++++++++++++++++++++++++++ ----------------
@echo ---------------- + Snapshot Loader has finished loading + ----------------
@echo ---------------- + the snapshot and associated data     + ----------------
@echo ---------------- + into your data directory, enjoy!     + ----------------
@echo ---------------- ++++++++++++++++++++++++++++++++++++++++ ----------------
@echo --------------------------------------------------------------------------&&pause&&pause