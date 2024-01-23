#!/bin/bash

# Set the interval for switching between windows (in seconds)
WINDOW_SWITCH_INTERVAL=48

# Set the interval for pressing the space bar (in seconds)
SPACE_INTERVAL=12

# Set the interval for pressing Page Up (in seconds)
PAGE_UP_INTERVAL=4
   
# Set the interval for pressing Ctrl + Tab (in seconds)
TAB_INTERVAL=16



# Function to simulate key presses
simulate_key_press() {
    xdotool key $1
}

# Function to switch between two active windows using Alt + Tab + Enter
switch_between_windows() {
    # Press and hold Alt
    xdotool keydown Alt
    sleep 0.1

    # Press Tab and Enter and release Alt after a short interval
    xdotool key Tab
    sleep 0.1
    xdotool key Return
    sleep 0.1
    xdotool keyup Alt
}

# Loop to press keys, switch between windows, and repeat in a continuous loop
while true; do
    # Switch between two active windows using Alt + Tab + Enter every 30 seconds
    switch_between_windows

    # Press the space bar continuously for 10 seconds
    for ((i=0; i<$SPACE_INTERVAL; i++)); do
        simulate_key_press space
        sleep 1.1
    done

    # Press Page Up continuously for 4 seconds
    for ((i=0; i<$PAGE_UP_INTERVAL; i++)); do
        simulate_key_press Prior
        sleep 1.1
    done

    # Press Ctrl + Tab
    simulate_key_press ctrl+Tab

    # Sleep for 1 second (adjust if necessary)

    # Switch between two active windows using Alt + Tab + Enter every 30 seconds
    switch_between_windows

    # Press the space bar continuously for 10 seconds
    for ((i=0; i<$SPACE_INTERVAL; i++)); do
        simulate_key_press space
        sleep 1
    done

    # Press Page Up continuously for 4 seconds
    for ((i=0; i<$PAGE_UP_INTERVAL; i++)); do
        simulate_key_press Prior
        sleep 1  
    done

    # Press Ctrl + Tab
    simulate_key_press ctrl+Tab

    # Sleep for the remaining time in the loop interval
  
done
   

