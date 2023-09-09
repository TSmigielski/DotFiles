#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

# Launch polybars!
polybar --reload primary &
polybar --reload secondary &

echo "Polybars launched..."
