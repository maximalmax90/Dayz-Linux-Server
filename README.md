Current issues
=================
1. Server build 1.64.xxxxx not working - freezes on server creation (one day devs will fix it... I hope...)
Server binaries: https://forums.bohemia.net/forums/topic/213193-arma-2-oa-update-164-build-144629-release-candidate-for-eol-end-of-life/

2. Server build 1.63.130836 run correct, but player get "Session terminated" (idk why)
Server binaries: https://forums.bohemia.net/forums/topic/189123-arma-2-operation-arrowhead-linux-server-163130836/

3. Server build 1.62.95248 run correct, mission start correct and work correct, but need more tests. Status Icons always disabled (idk why)
Server binaries: included

4. Server almost always died if battleye is enabled (idk why)

battleye.so not included because of useless

Dayz-Linux-Server
=================

A private hive DayZ 1.9.0 server on Linux
Only for test and fixes...

Installation instructions
=========================

1. The following programs must be installed on your Linux system: screen, tar, gcc, perl, mysql.

2. ~Download and install newest ArmA beta patch (http://www.arma2.com/beta-patch.php).~ (deprecated)

3. Copy the whole "ArmA 2: Operation Arrowhead" directory from Windows to server Linux-directory.<br>
   ArmA2 directory should contain subdirectories "Addons", "Dta", "Expansion", etc.<br>
   Example: pack with PKZIP (WinZip, PowerArchiver, etc.) on Windows and unpack with "unzip" on Linux.<br>
   DO NOT use upper case letters in the ArmA2 directory name (or in any files that the server uses 
   like missions or mods):<br>
   GOOD: "/home/bob/arma2arrowhead"<br>
   BAD:  "/home/bob/ArmA2ArrowHead"<br>
   ~http://rutor.org/torrent/240581/~ (deprecated)

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
