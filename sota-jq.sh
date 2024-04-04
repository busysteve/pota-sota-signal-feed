jq '.[] | [.timeStamp,.activatorCallsign,.frequency,.associationCode,.summitCode,.mode] | @csv' 
