#!/bin/bash

# Set the interval for pressing the space bar (in seconds)
SPACE_INTERVAL=9

# Set the interval for pressing Page Up (in seconds)
PAGE_UP_INTERVAL=4

# Set the interval for pressing Ctrl + Tab (in seconds)
TAB_INTERVAL=12

# Function to simulate key presses
simulate_key_press() {
    xdotool key $1
}

# Loop to press keys in a continuous loop
while true; do
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

    # Sleep for 1 second (adjust if necessary)
    sleep 1

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

    # Sleep for 1 second (adjust if necessary)
    sleep 1
done

