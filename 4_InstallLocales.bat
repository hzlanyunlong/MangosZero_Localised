@ECHO OFF

set addrealmentry=YES

set DBType=POPULATED
set activity=N

set locFR=NO
set locES=NO
set locDE=NO
set locKO=NO
set locCH=NO
set locTW=NO
set locRU=NO
set locIT=NO
set locMX=NO


rem -- Change the values below to match your server --
set mysql=Tools\
set svr=localhost
set user=root
set pass=mangos
set port=3306
set wdb=mangos0
set wdborig=mangos0
set cdb=character0
set cdborig=character0
set rdb=realmd
set rdborig=realmd

rem -- Don't change past this point --

:main
color 0e
CLS
echo.
echo     __  __      _  _  ___  ___  ___      
echo    ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|   Database Localisation
echo    ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo    ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/      Loader v0.01
echo.
echo _____________________________________________________________
echo.
echo             Website / Forum / Wiki: https://getmangos.eu         
echo _____________________________________________________________
echo.
ECHO.
echo               Locales : F - Toggle French (%locFR%)
echo                         G - Toggle German (%locDE%)
echo                         R - Toggle Russian (%locRU%)
echo                         C - Toggle Chinese (%locCH%)
echo                         T - Toggle Taiwanese (%locTW%)
echo                         S - Toggle Spanish (%locES%)
echo                         M - Toggle Spanish (Mexican) (%locMX%)
echo                         K - Toggle Korean (%locKO%)
echo                         I - Toggle Italian (%locIT%)
echo.
echo                         N - Next Step
echo                         X - Exit
echo.
set /p activity=. Please select an activity ? : 
if %activity% == F goto ToggleLocFR:
if %activity% == f goto ToggleLocFR:
if %activity% == G goto ToggleLocDE:
if %activity% == g goto ToggleLocDE:
if %activity% == R goto ToggleLocRU:
if %activity% == r goto ToggleLocRU:
if %activity% == T goto ToggleLocTW:
if %activity% == t goto ToggleLocTW:
if %activity% == C goto ToggleLocCH:
if %activity% == c goto ToggleLocCH:
if %activity% == M goto ToggleLocMX:
if %activity% == m goto ToggleLocMX:
if %activity% == S goto ToggleLocES:
if %activity% == s goto ToggleLocES:
if %activity% == K goto ToggleLocKO:
if %activity% == k goto ToggleLocKO:
if %activity% == I goto ToggleLocIT:
if %activity% == i goto ToggleLocIT:

if %activity% == N goto Step1:
if %activity% == n goto Step1:

if %activity% == X goto done:
if %activity% == x goto done:
if %activity%. == . goto main:
goto main

:ToggleLocFR
if %locFR% == NO goto ToggleLocFRNo:
if %locFR% == YES goto ToggleLocFRYes:
goto main

:ToggleLocFRNo
set locFR=YES
goto main

:ToggleLocFRYes
set locFR=NO
goto main

:ToggleLocCH
if %locCH% == NO goto ToggleLocCHNo:
if %locCH% == YES goto ToggleLocCHYes:
goto main

:ToggleLocCHNo
set locCH=YES
goto main

:ToggleLocCHYes
set locCH=NO
goto main

:ToggleLocTW
if %locTW% == NO goto ToggleLocTWNo:
if %locTW% == YES goto ToggleLocTWYes:
goto main

:ToggleLocTWNo
set locTW=YES
goto main

:ToggleLocTWYes
set locTW=NO
goto main

:ToggleLocDE
if %locDE% == NO goto ToggleLocDENo:
if %locDE% == YES goto ToggleLocDEYes:
goto main

:ToggleLocDENo
set locDE=YES
goto main

:ToggleLocDEYes
set locDE=NO
goto main

:ToggleLocES
if %locES% == NO goto ToggleLocESNo:
if %locES% == YES goto ToggleLocESYes:
goto main

:ToggleLocESNo
set locES=YES
goto main

:ToggleLocESYes
set locES=NO
goto main

:ToggleLocMX
if %locMX% == NO goto ToggleLocMXNo:
if %locMX% == YES goto ToggleLocMXYes:
goto main

:ToggleLocMXNo
set locMX=YES
goto main

:ToggleLocMXYes
set locMX=NO
goto main

:ToggleLocRU
if %locRU% == NO goto ToggleLocRUNo:
if %locRU% == YES goto ToggleLocRUYes:
goto main

:ToggleLocRUNo
set locRU=YES
goto main

:ToggleLocRUYes
set locRU=NO
goto main

:ToggleLocIT
if %locIT% == NO goto ToggleLocITNo:
if %locIT% == YES goto ToggleLocITYes:
goto main

:ToggleLocITNo
set locIT=YES
goto main

:ToggleLocITYes
set locIT=NO
goto main

:ToggleLocKO
if %locKO% == NO goto ToggleLocKONo:
if %locKO% == YES goto ToggleLocKOYes:
goto main

:ToggleLocKONo
set locKO=YES
goto main

:ToggleLocKOYes
set locKO=NO
goto main

:Step1
if not exist %mysql%\mysql.exe then goto patherror
color 08
CLS
echo.
echo     __  __      _  _  ___  ___  ___      
echo    ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|    Database Setup                                      
echo    ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo    ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/  and World Loader
echo.
echo _____________________________________________________________
echo.
echo.
set /p svr=What is your MySQL host name?           [%svr%] : 
if %svr%. == . set svr=localhost
set /p user=What is your MySQL user name?                [%user%] : 
if %user%. == . set user=root
set /p pass=What is your MySQL password?               [%pass%] : 
if %pass%. == . set pass=mangos
set /p port=What is your MySQL port?                     [%port%] : 
if %port%. == . set port=3306

set showWorld=1
if %showWorld% == 1 set /p wdb=What is your World database name?         [%wdb%] : 
if %wdb%. == . set wdb=%wdborig%

color 02

:WorldDB
if %locFR% == YES goto LoadFR:

:WorldDB1
if %locDE% == YES goto LoadDE:

:WorldDB2
if %locKO% == YES goto LoadKO:

:WorldDB3
if %locCH% == YES goto LoadCH:

:WorldDB4
if %locTW% == YES goto LoadTW:

:WorldDB5
if %locES% == YES goto LoadES:

:WorldDB6
if %locMX% == YES goto LoadMX:

:WorldDB7
if %locRU% == YES goto LoadRU:

:WorldDB8
if %locIT% == YES goto LoadIT:

goto done:

:LoadFR
echo  Loading French Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_Gameobject.sql
REM echo  .... GossipMenu
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_Items.sql
REM echo  .... PageText
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\French\French_Quest.sql
goto WorldDB1:

:LoadDE
echo  Loading German Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_Gameobject.sql
echo  .... GossipMenu
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_Items.sql
echo  .... PageText
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\German\German_Quest.sql
goto WorldDB2:

:LoadKO
echo  Loading Korean Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_Gameobject.sql
REM echo  .... GossipMenu
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_Items.sql
REM echo  .... PageText
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_PageText.sql
REM echo  .... Quests
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Korean\Korean_Quest.sql
goto WorldDB3:

:LoadCH
echo  Loading Chinese Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_Gameobject.sql
echo  .... GossipMenu
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_Items.sql
echo  .... PageText
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_Quest.sql
echo  .... NpcText
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Chinese\Chinese_NpcText.sql
goto WorldDB4:

:LoadTW
echo  Loading Taiwanese Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_Gameobject.sql
REM echo  .... GossipMenu
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_Items.sql
REM echo  .... PageText
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_PageText.sql
REM echo  .... Quests
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Taiwanese\Taiwanese_Quest.sql
goto WorldDB5:

:LoadES
echo  Loading Spanish Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_Gameobject.sql
REM echo  .... GossipMenu
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_Items.sql
REM echo  .... PageText
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish\Spanish_Quest.sql
goto WorldDB6:

:LoadMX
echo  Loading Spanish (south American) Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_Gameobject.sql
REM echo  .... GossipMenu
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_Items.sql
REM echo  .... PageText
REM %mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Spanish_South_American\SpanishSA_Quest.sql
goto WorldDB7:

:LoadRU
echo  Loading Russian Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_Gameobject.sql
echo  .... GossipMenu
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_Items.sql
echo  .... PageText
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Russian\Russian_Quest.sql
goto WorldDB8:

:LoadIT
echo Loading Italian Locale into World Database %wdb%
echo  .... Creatures
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_Creature.sql
echo  .... GameObjects
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_Gameobject.sql
echo  .... GossipMenu
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_GossipMenu.sql
echo  .... Items
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_Items.sql
echo  .... PageText
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_PageText.sql
echo  .... Quests
%mysql%mysql -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < Translations\Italian\Italian_Quest.sql
goto done:

:patherror
echo Cannot find required files.
pause
goto :error

:error
echo _____________________________________________________________
echo.
echo  Install Database Process Failed
echo _____________________________________________________________
echo.
goto finish:

:done
color 08
echo.
echo     __  __      _  _  ___  ___  ___      
echo    ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|   Database Localisation
echo    ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \
echo    ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/        Loader 
echo.
echo _____________________________________________________________
echo.
echo  Database Creation and Load complete
echo _____________________________________________________________
echo.
echo Done :)
echo.
:finish
pause