#sed 's/\\\"//g' | sed 's/\"//g' | awk -F, '{cmd = sprintf( "echo \"%s  %s  %s/%s\" | ./signal-pota-sota.sh", $2, $3, $4, $5 ); system( cmd )}'
awk '{cmd = sprintf( "echo \"%s  %s  %s  %s\" | ./signal-pota-sota.sh", $1, $2, $3, $4 ); system( cmd )}'
