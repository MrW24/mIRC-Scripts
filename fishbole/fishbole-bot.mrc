;-------------CONFIG-------------
alias config.load {
echo -a Loading config...
set %owner W24
;If you're an owner, you also have to be an admin to have access to admin commands.
set %admin1 %owner
set %admin2 W24-Mobile
set %admin3 Bimps
set %admin4 AFKimps
set %network irc.rizon.net 6667
set %nick fishbole-bot
set %nickservpass none
set %networkpass none
set %username none
echo -a Config loaded! You do not need to do this anymore as fishbole will now automatically load the config if you start fishbole with /fishbole.start
}
;-------------CONFIG END----------
ON *:TEXT:!join *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %admin3 || %admin4 ) {
    join $2-
  }
  else notice $nick  access denied
}

ON *:TEXT:!part *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %admin3 || %admin4 ) {
    part $2-
  }
  else msg $nick access denied
}

ON *:TEXT:.bots:#: { msg $chan Reporting in! [mSL] fishbole-bot run by %owner $+ . Say !help for more information. }
ON *:TEXT:!help:#: { msg $chan fishbole bot by W24 for #eeforumsanarchy - https://github.com/mrw24/fishbole }
ON *:TEXT:!say *:#: { msg $chan $2- }



ON *:TEXT:!calc*:#:{ msg # $iif($regsubex($remove($2-,$chr(32),$chr(44)),/((^|[+-/^*%]+)(([0-9]|\56)+)(k|m|b)|(^|[+-/^*%]+)(([0-9]|\56)+)|(^|[+-/^*%]+)(\50(.+?)\51))/ig,),Syntax Error,$iif(!$2,Syntax Error,fishboles calculator> $2- = $regsubex($ticks,$calc($regsubex($ticks,$remove($2-,$chr(44),$chr(32)),/(^|[+-/*%]+|[+-/*%]+\50)(([0-9]|\56)+)(k|m|b)/ig,\1 $+ ( $+ \2 $+ $iif(\4 == b,*1000000000,$iif(\4 == m,*1000000,*1000)) $+ ))),/\G([+-]?\d+?)(?=(?:\d{3})++(?=\.\d++$|$))/g,\1 $+ $chr(44)))) }

ON *:TEXT:fishbole*:#: 
set %bot on
if (%bot == on) 
var %fishbole $rand(1,20)
if (%fishbole == 1) {  msg $chan hi im fishbole }
if (%fishbole == 2) {  msg $chan hi im fishbole and wow fishboles r everiewhere }
if (%fishbole == 3) {  msg $chan hi im fishbole and ive heard that bruce is trying to take ovre by becoming the mascot of ee that must not happen so i thote id compete with him this is an improved versione of the ee we have thats not toopinated or bruced but rathre fishbolified i hope u enjoy }
if (%fishbole == 4) {  msg $chan we may not be the greatest things in the multiverse but its nice to try to see if we can work togethre }
if (%fishbole == 5) {  msg $chan hi im fishbole and reporting cheetres is useless so i dont think mods will do anything about it regardless }
if (%fishbole == 6) {  msg $chan hi im fishbole and id be able to play "the final countdown" rite before bans end thatd be nice }
if (%fishbole == 7) {  msg $chan hi im fishbole and this wood be nice as id be able to protect creations in free edit worlds }
if (%fishbole == 8) {  msg $chan hi im fishbole and maybe u just need 3d glaseses }
if (%fishbole == 9) {  msg $chan fatbole is offended }
if (%fishbole == 10) {  msg $chan hi im fishbole and thx for demonstrating ur post by replying to this topic }
if (%fishbole == 11) {  msg $chan hi im fishbole and ive got something very important to tell u all exactlie 100 days ago creature said that jawapas shutting down ee 100 days from then }
if (%fishbole == 12) {  msg $chan hi im fishbole and fishbole likes this u should try drawing me like that i think thatll be interesting }
if (%fishbole == 13) {  msg $chan hi im fishbole and its a good thing ive gotten mr diver smilie }
if (%fishbole == 14) {  msg $chan its a secrete place where nerds meditate on how to create bots to take over the worlde }
if (%fishbole == 15) {  msg $chan hi im fishbole and does anyone know how atilla hacked the game? if anyone knows pls pm me how he did it and how i can do it too thx }
if (%fishbole == 16) {  msg $chan hi im fishbole ive never been bannede but i think i mite after my programs done and i use it }
if (%fishbole == 17) {  msg $chan 5/5 fishboles }
if (%fishbole == 18) {  msg $chan hi im fishbole id spend gems but mummie wont buy me any pls help }
if (%fishbole == 19) {  msg $chan hi im fishbole and i like that u reversed to Fishbowl Astronaut but i still cant use it knowing that others will see the New Astronaut and thats a disgrace to the true Astronaut we must praise }
if (%fishbole == 20) {  msg $chan yes sir i mean hi im n1kf i mean hi im fishbole }

alias fishbole.start {
echo -a Loading config...
config.load
echo -a Starting W24Bot...
nick %nick
server %network
quote pass %username $+ : $+ %networkpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
msg nickserv identify %nickservpass
echo -a W24Bot is now up and running!
alias fishbole.restart {
echo Restarting fishbole...
quit Manually restarted. $1-
echo -a Loading config...
config.load
echo -a Attempting to connect to %network $+ ...
nick %nick
server %network
quote pass %username $+ : $+ %networkpass
echo -a fishbole has been restarted.
}
alias fishbole.stop {
echo -a Stopping fishbole...
quit Manually stopped. $1-
echo -a fishbole has been stopped.
