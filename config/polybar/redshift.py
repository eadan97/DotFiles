#!/bin/python3
import subprocess
# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""


temp = stdoutdata = subprocess.getoutput( "redshift -p 2>/dev/null | grep 'Temperatura de cor' | cut -d' ' -f3")

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo "%{F#65737E}$icon"       # Greyed out (not running)
elif [[ $temp -ge 5000 ]]; then
    echo "%{F#8FA1B3}$icon"       # Blue
elif [[ $temp -ge 4000 ]]; then
    echo "%{F#EBCB8B}$icon"       # Yellow
else
    echo "%{F#D08770}$icon"       # Orange
fi
