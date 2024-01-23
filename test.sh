#!/bin/bash

# Set the interval for switching between windows (in seconds)
#WINDOW_SWITCH_INTERVAL=48


# Scroll variables
# The amount of clicks to be made on space(for a down scroll) and Prior(pageUp for upscroll)
# You can give random numbers for different amount times spent crolling each tab of scroll each tab

#First window scroll
SPACE_INTERVAL1=12
PAGE_UP_INTERVAL1=4

#second window scroll
SPACE_INTERVAL2=9
PAGE_UP_INTERVAL2=5

#Third window scroll
SPACE_INTERVAL3=11
PAGE_UP_INTERVAL3=5

#Fourth window scroll
SPACE_INTERVAL4=11
PAGE_UP_INTERVAL4=6


#Sleep time for scroll
# This is the amount of time for each scroll key press delay

#Scroll 1
DELAY1=1.1

#Scroll 2
DELAY2=3

#Scroll 3
DELAY3=1.2

#Scroll 4
DELAY4=1.1

# Function to simulate key presses
simulate_key_press() {
    xdotool key $1
}

simulate_key_hold() {
    xdotool keydown $1
}

simulate_key_release() {
    xdotool keyup $1
}

simulate_scroll_down() {
    xdotool click 5
}



#Function for the first switch
# First one should be no right move as the first option that will show upon alt + tab is the next screen
# second one move right once
# third and fourth move right twice

# Function to switch between two active windows using Alt + Tab + Arrow Right + Return
switch_between_windows() {
    # Press and hold Alt
    xdotool keydown Alt
    sleep 0.1

    # Press Tab, Arrow Right, and Enter and release Alt after a short interval
    xdotool key Tab
    sleep 0.1
    xdotool key Right
    sleep 0.1
    xdotool key Right
    sleep 0.1
    xdotool key Return
    sleep 0.1
    xdotool keyup Alt
}

# User
# I want to use a radomize in the bash script, so I want it out of random to press space key then randomize
#  the sleep time between 1 1.1 1.2 1.3 1.4 1.5 1.6 to 3 so for each press of key space the sleep 
#  time will randomize between 1 and 4 which includes decimals. also depending on the sleep 
#  time the amount of space clicks will change, if sleep time is less than 1.5 space click is
#   12 if sleep time is less than 2 but greater than 1.5 dont space click next but space keydown 
#   for sleep  1.5 they keyup space, but this will minus 2 from the original space click, if sleep 
#   is greater than 2 dont press space next instaed keydown for sleep 2 and then key up, then minus 
#   3 from the space click. 


# Loop to press keys, switch between windows, and repeat in a continuous loop
while true; do
    
    #First window
    # Press the space bar continuously for 10 seconds
    for ((i=0; i<SPACE_INTERVAL1; i++)); do
        simulate_scroll_down

        # Randomize sleep time between 1 and 4 (including decimals)

        # Generate a random number between 1 and 3 for the first digit
        first_digit=$(( (RANDOM % 2) + 1 ))

        # Generate a random number between 0 and 9 for the second digit
        second_digit=$(( RANDOM % 10 ))

        # Combine the two digits with a dot in between
        DELAY="${first_digit}.${second_digit}"

        # Print the random decimal
        echo "Random Decimal: $DELAY"

        # Use bc for floating-point comparisons
        sleep $DELAY
        simulate_scroll_down
      
    done


    # Press Page Up continuously for 4 seconds
    for ((i=0; i<$PAGE_UP_INTERVAL1; i++)); do
        simulate_key_press Prior
        sleep $DELAY1
    done

    # Press Ctrl + Tab
    simulate_key_press ctrl+Tab


    #Second window
    # Switch window
    switch_between_windows
    # Press the space bar continuously for 10 seconds to simulatre  down scroll
    for ((i=0; i<$SPACE_INTERVAL2; i++)); do
        simulate_key_hold space
        sleep 0.5
        simulate_key_release space
        sleep $DELAY2
    done

    # Press Page Up continuously for 4 seconds to simulate up scroll
    for ((i=0; i<$PAGE_UP_INTERVAL2; i++)); do
        simulate_key_hold Prior
        sleep 0.5
        simulate_key_release Prior
        sleep $DELAY2 
    done

    # Swicth tab
    simulate_key_press ctrl+Tab

    #Third window
    # Switch between two active windows using Alt + Tab + Arrow Right + Return every 40 seconds
    switch_between_windows
    # Press the space bar continuously for 10 seconds to simulatre  down scroll
    for ((i=0; i<$SPACE_INTERVAL3; i++)); do
        simulate_key_press space
        sleep $DELAY3
    done

    # Press Page Up continuously for 4 seconds to simulate up scroll
    for ((i=0; i<$PAGE_UP_INTERVAL3; i++)); do
        simulate_key_press Prior
        sleep $DELAY3
    done

    # Swicth tab
    simulate_key_press ctrl+Tab

    #Fourth window
    # Switch between two active windows using Alt + Tab + Arrow Right + Return every 40 seconds
    switch_between_windows
        # Press the space bar continuously for 10 seconds to simulatre  down scroll
    for ((i=0; i<$SPACE_INTERVAL4; i++)); do
        simulate_key_press space
        sleep $DELAY4
    done

    # Press Page Up continuously for 4 seconds to simulate up scroll
    for ((i=0; i<$PAGE_UP_INTERVAL4; i++)); do
        simulate_key_press Prior
        sleep $DELAY4  
    done

    # Swicth tab
    simulate_key_press ctrl+Tab

    #Go back to first window
    switch_between_windows
   
    

done
