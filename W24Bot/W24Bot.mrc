;A big thanks to laser3 for the original code
;If you're stuck, see README.md
;--------------CONFIG-------------
alias config.load {
set %owner W24
;If you're the owner, you also need to be an admin to be able to use admin commands.
set %admin1 %owner
set %admin2 W24-Mobile
set %mod1 xerox123
set %mod2 xerox123-mobile
set %network irc.rizon.net 6667
set %nickservpass insertpasshere
set %nick W24Bot_
}
;-------------END CONFIG----------
ON *:TEXT:@join *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %mod1 || %mod2 ) {
    join $2-
  }
  else notice $nick 5Access Denied.
}

ON *:TEXT:@part *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %mod1 || %mod2 ) {
    part $2-
  }
  else notice $nick 5Access Denied.
}

ON *:TEXT:@say *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %mod1|| %mod2 ) && ( $nick == %trusted1 || %trusted2 ) {
     msg $chan $2- 
  }  
  else notice $nick 5Access Denied.
}

ON *:TEXT:@kick *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %mod1 || %mod2 ) && ( $nick == %trusted1 || %trusted2 ) {
    kick $chan $2-
  }
  else notice $nick 5Access Denied.
} 

ON *:TEXT:@msg *:#: {
  if ( $nick == %admin1 || %admin2 ) && ( $nick == %mod1 || %mod2 )&& ( $nick == %trusted1 || %trusted2 ) {
    msg $2-
  }
  else notice $nick 5Access Denied.
} 


ON *:TEXT:@stop *:#: {
  if ( $nick == %admin1 || %admin2 ) {
    quit Stopped by $nick $+ . Reason: $2-
  }
  else notice $nick 5Access Denied.
} 

ON *:TEXT:@calc*:#:{ msg # $iif($regsubex($remove($2-,$chr(32),$chr(44)),/((^|[+-/^*%]+)(([0-9]|\56)+)(k|m|b)|(^|[+-/^*%]+)(([0-9]|\56)+)|(^|[+-/^*%]+)(\50(.+?)\51))/ig,),Syntax Error,$iif(!$2,Syntax Error,[Calculator] $2- = $regsubex($ticks,$calc($regsubex($ticks,$remove($2-,$chr(44),$chr(32)),/(^|[+-/*%]+|[+-/*%]+\50)(([0-9]|\56)+)(k|m|b)/ig,\1 $+ ( $+ \2 $+ $iif(\4 == b,*1000000000,$iif(\4 == m,*1000000,*1000)) $+ ))),/\G([+-]?\d+?)(?=(?:\d{3})++(?=\.\d++$|$))/g,\1 $+ $chr(44)))) }
ON *:TEXT:.bots:#: msg $chan Reporting in! [mSL] W24Bot run by %owner $+ . Say @help for more information. 
ON *:TEXT:@throw *:#: describe $chan throws a rock at $2-, then watches as $2- bleeds to death.
ON *:TEXT:@hello *:#: { msg $2 $nick would like to say hello! }
ON *:TEXT:@feed *:#: describe $chan serves $2- some cooked salmon on a fancy platter
ON *:TEXT:@poison *:#: describe $chan forces a potion of poison down $2-'s throat causing him to die within five minutes
ON *:TEXT:@help:#: { msg $chan 10W24Bot run by %owner - https://github.com/mrw24/w24bot }
ON *:TEXT:@stab *:#: describe $chan sneaks up behind $2-, then stabs $2- in the back with a hatchet. 
ON *:TEXT:@drown *:#: describe $chan drags $2- to a glistening pool of water, then, with a loud shout of "DIEEE," pushes $2- in, succesfully drowning him.
ON *:TEXT:+kock:#: msg $chan dem Kock
ON *:TEXT:@cloud:#: msg $chan 4Free Cloud Server for a Lifetime! https://cloudrino.net/?ref=78342
ON *:TEXT:@groups:#: msg $chan User Groups: 7Owners 5Administrators, 3Moderators, 10Trusted, 12Users
ON *:TEXT:@groups trusted:#: msg $chan 10Trusted: %trusted1 $+ , %trusted2
ON *:TEXT:@groups moderators:#: msg $chan 3Moderators: %mod1 $+ , %mod2
ON *:TEXT:@groups administrators:#: msg $chan 5Administrators: %admin1 $+ , %admin2
ON *:TEXT:@timebomb *:#: describe $chan checks his pockets for a timed bomb and finds none. | msg $chan Sorry $nick $+ , looks like I don't have a time bomb on me at the moment.


on *:TEXT:@fire*:#: 
set %bot on
if (%bot == on) {
  var %fire $rand(1,20)
  if (%fire == 1) {  msg $chan 7Fired. }
  if (%fire == 2) {  msg $chan 7Fired. }
  if (%fire == 3) {  msg $chan 7Fired. }
  if (%fire == 4) {  msg $chan 4You died! }
  if (%fire == 5) {  msg $chan 7Fired. }
  if (%fire == 6) {  msg $chan 7Fired. }
  if (%fire == 7) {  msg $chan 7Fired. }
  if (%fire == 8) {  msg $chan 7Fired. }
  if (%fire == 9) {  msg $chan 7Fired. }
  if (%fire == 10) {  msg $chan 7Fired. }
  if (%fire == 11) {  msg $chan 7Fired. }
  if (%fire == 12) {  msg $chan 7Fired. }
  if (%fire == 13) {  msg $chan 7Fired. }
  if (%fire == 14) {  msg $chan 7Fired. }
  if (%fire == 15) {  msg $chan 7Fired. }
  if (%fire == 16) {  msg $chan 7Fired. }
  if (%fire == 17) {  msg $chan 7Fired. }
  if (%fire == 18) {  msg $chan 4You died!  }
  if (%fire == 19) {  msg $chan 7Fired. }
  if (%fishbole == 20) {  msg $chan 7Fired. }
  unset %bot
  
  alias w24bot.start {
 echo -a [W24Bot] Starting W24Bot...
 echo -a [W24Bot] Loading config...
 config.load
 echo -a [W24Bot] Attempting to connect to %network $+ ...
  server %network
  nick %nick
  echo -a [W24Bot] Attempting to identify to NickServ...
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  echo -a [W24Bot] W24Bot has been started.
  }
  alias w24bot.stop {
  echo -a [W24Bot] Stopping W24Bot...  
  quit Manually stopped by %owner $+ . $1-
  echo -a [W24Bot] W24Bot has been stopped.
  }
  alias w24bot.restart {
  echo -a [W24Bot] Restarting W24Bot...  
  quit Manually restarted. $1-
  echo -a [W24Bot] Loading config...
  config.load
  echo -a [W24Bot] Attempting to connect to %network $+ ...
  server %network  
  nick %nick
  echo -a [W24Bot] Attempting to identify to NickServ...
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  msg nickserv identify %nickservpass
  echo -a [W24Bot] W24Bot has been restarted.
  }
  
