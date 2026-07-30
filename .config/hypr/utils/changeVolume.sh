#!/bin/bash
# changeVolume — PulseAudio/PipeWire version
#
# Usage:
#   changeVolume +2%      raise
#   changeVolume -2%      lower
#   changeVolume 50%      set absolute
#   changeVolume toggle   toggle mute (also: mute / unmute / 1 / 0)

# Arbitrary but unique message tag
msgTag="myvolume"

sink="@DEFAULT_SINK@"

# Highest volume the script will allow (pactl does not cap at 100 by itself)
maxVolume=100

get_volume() {
    # First line, first channel only -> a single bare integer.
    # A 5.1 sink prints six percentages; taking them all is what produces
    # "Volume: 707070%".
    pactl get-sink-volume "$sink" |
        awk -F'/' 'NR==1 { gsub(/[^0-9]/, "", $2); print $2; exit }'
}

get_mute() {
    pactl get-sink-mute "$sink" | awk '{print $2}'   # -> yes / no
}

# Apply the change
case "$1" in
    toggle|mute|unmute|1|0)
        pactl set-sink-mute "$sink" "$1"
        ;;
    *)
        pactl set-sink-volume "$sink" "$@"
        ;;
esac

volume="$(get_volume)"
mute="$(get_mute)"

# Clamp to maxVolume
if [[ -n "$volume" && "$volume" -gt "$maxVolume" ]]; then
    pactl set-sink-volume "$sink" "${maxVolume}%"
    volume="$maxVolume"
fi

if [[ "$mute" == "yes" || "$volume" -eq 0 ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted \
        -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    # Pick an icon that matches the level
    if   [[ "$volume" -lt 34 ]]; then icon="audio-volume-low"
    elif [[ "$volume" -lt 67 ]]; then icon="audio-volume-medium"
    else                              icon="audio-volume-high"
    fi

    # Show the volume notification
    # dunstrc format should be plain (no %p / %n), otherwise dunst prints
    # the value a second time.
    dunstify -a "changeVolume" -u low -i "$icon" \
        -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound.
#
# canberra-gtk-play spins up GTK and re-reads the sound theme on every call,
# which is what makes held keys spike the CPU. Playing the file directly is
# far cheaper, and the lock drops the sound whenever one is already playing
# instead of queueing dozens of them.
soundFile="/usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"

if [[ -r "$soundFile" ]]; then
    (
        flock -n 9 || exit 0
        if command -v pw-play >/dev/null; then
            pw-play "$soundFile"
        else
            paplay "$soundFile"
        fi
    ) 9>"${XDG_RUNTIME_DIR:-/tmp}/changeVolume.sound.lock" 2>/dev/null &
fi
