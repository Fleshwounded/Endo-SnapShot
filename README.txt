========================================================
========================================================
========= Endo V2.5 Blockchain Snapshot ================
========================================================
==================    README   =========================

Welcome to SaltineChips' friendly EndoV2.5 snapshot 
readme and guide where I'll take you through how to
use this feature to quickly get you started without the 
hassle of waiting 16 hours for a sync like I did ;)

Please follow along the steps and contact us on 
discord with your questions, we're happy to help!

1. Open and read this readme, good job! This one's done

2. If you are a windows user, please skip to step 2A.
otherwise continue to step 3.

2A. Run the Run_Me_Second.bat and follow along

3. Locate you data directory (if you have previously ran the wallet)
or create one if you haven't or alternatively let the wallet run once
default for windows is C:\Users\YOURUSERNAME\AppData\Roaming\endocoinV2
default for Macintosh is ~ Library/Application Support/endocoinV2
default for Linux is ~/.endocoinV2

4. Delete the following files/folders (if they exist)
	- database (folder)
	- txleveldb (folder)
	- .lock (file)
	- blk0001.dat (file)
	- db.log (file)
	- debug.log (file)
	- endocoin.conf (file)
	- peers.dat (file)

DO NOT DELETE YOUR "wallet.dat" AS THAT CONTAINS YOUR COINS!!!!!

5. Copy contents of "bin\chaindata" folder to your data directory (endocoinV2)
if you haven't ran the wallet previously then create a folder
called "endocoinv2" in the data directory location mentioned 
previously in step 3 and copy the contents into them.

6. Run your wallet and let it finish syncing the last few blocks

7. enjoy a fully synced blockchain ;)