Current issues
=================
1. Server build 1.64.xxxxx not working - freezes on server creation (one day devs will fix it... I hope...)
2. Server build 1.63.130836 start correct, but player get "Session terminated" (looking for a reason)
3. Server almost always died if battleye is enabled (idk why)

Dayz-Linux-Server
=================

~A private hive DayZ 1.8.0.3 server on Linux~

Migration to DayZ 1.9.0 in progress... At the moment the build is not working.

Installation instructions
=========================

1. The following programs must be installed on your Linux system: screen, tar, gcc, perl, mysql.

2. ~Download and install newest ArmA beta patch (http://www.arma2.com/beta-patch.php).~ (depricated)

3. Copy the whole "ArmA 2: Operation Arrowhead" directory from Windows to server Linux-directory.<br>
   ArmA2 directory should contain subdirectories "Addons", "Dta", "Expansion", etc.<br>
   Example: pack with PKZIP (WinZip, PowerArchiver, etc.) on Windows and unpack with "unzip" on Linux.<br>
   DO NOT use upper case letters in the ArmA2 directory name (or in any files that the server uses 
   like missions or mods):<br>
   GOOD: "/home/bob/arma2arrowhead"<br>
   BAD:  "/home/bob/ArmA2ArrowHead"<br>
   ~http://rutor.org/torrent/240581/~ (depricated)

3. Download and install DayZ Mod 1.9.0 (http://se1.dayz.nu/latest/1.9.0/Stable/29/%40DayZMod_Client-1.9.0-Full.rar).

4. Run ./install<br>
   Watch the messages - they might inform you whether your installation
   failed. Double check that all directories were renamed to lower case.
   Remove any .dll files you might still find (in battleye, expansion and
   expansion/battleye directories).<br>
   When adding mission .pbo's or mods remember to run ./tolower again or
   manually change the filenames to lowercase.<br> ANY uppercase letter in
   a filename will crash the server!<br>
   <pre>$ for x in *; do mv $x `echo $x | tr [A-Z] [a-z]`; done</pre>

5. Create database "dayz" (login: "dayz", password: "dayz") and load database.sql into Mysql.<br>
   Load vehicle objects:
   <pre>LOAD DATA INFILE 'object_init_data.txt' INTO TABLE Object_init_DATA;
   LOAD DATA INFILE 'object_init_data.txt' INTO TABLE Object_DATA;
   Or use mysqlimport:
   $ mv object_init_data.txt Object_init_DATA.txt
   $ mysqlimport -u root -p --local dayz Object_init_DATA.txt  
   $ mv Object_init_DATA.txt Object_DATA.txt
   $ mysqlimport -u root -p --local dayz Object_DATA.txt
   </pre>
   $ chmod +x install server *.sh *.pl<br>
   $ sudo apt-get install libjson-xs-perl<br>
   For 64-bit only:<br>
   $ sudo apt-get install lib32stdc++6 

6. Run ./server.sh for test<br>
   Watch the messages - they might inform you whether your installation failed.

7. Run ./restarter.pl<br>
   $ screen -r




