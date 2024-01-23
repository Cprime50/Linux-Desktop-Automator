#!/bin/bash

# Set the interval for each scrolling phase (in seconds)
SCROLL_INTERVAL=20

# Set the interval for pressing Ctrl + Tab (in seconds)
CTRL_TAB_INTERVAL=1

# Function to simulate key presses
simulate_key_press() {
    xdotool key $1
}

# Loop to simulate scrolling up and down, followed by Ctrl + Tab, in a continuous loop
while true; do
    # Simulate scrolling down for 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Down
        sleep 1
    done

    # Simulate scrolling up for the next 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Up
        sleep 1
    done

    # Press Ctrl + Tab
    simulate_key_press ctrl+Tab

    # Sleep for 1 second to allow Ctrl + Tab to take effect
    sleep $CTRL_TAB_INTERVAL

    # Simulate scrolling down for 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Down
        sleep 1
    done

    # Simulate scrolling up for the next 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Up
        sleep 1
    done

    # Press Ctrl + Shift + Tab
    simulate_key_press ctrl+shift+Tab

    # Sleep for 1 second to allow Ctrl + Shift + Tab to take effect
    sleep $CTRL_TAB_INTERVAL

    # Simulate scrolling down for 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Down
        sleep 1
    done

    # Simulate scrolling up for the next 20 seconds
    for ((i=0; i<$SCROLL_INTERVAL; i++)); do
        simulate_key_press Up
        sleep 1
    done

    # Press Ctrl + Tab
    simulate_key_press ctrl+Tab

    # Sleep for 1 second to allow Ctrl + Tab to take effect
    sleep $CTRL_TAB_INTERVAL
done

