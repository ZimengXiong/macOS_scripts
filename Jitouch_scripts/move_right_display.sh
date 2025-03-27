#!/bin/zsh

# Define yabai path
YABAI_PATH="/opt/homebrew/bin/yabai"

# Define total number of spaces
max_spaces=9

# Function to get the current space index
get_current_space() {
    # Get the current space index using yabai
    current_space=$($YABAI_PATH -m query --spaces --space | jq '.index')
    echo $current_space
}

# Get the current space index
current=$(get_current_space)

# Calculate next space with wrap around
next=$((current - 1))
if [ "$next" -lt "1" ]; then
    next=$max_spaces  # Wrap around to first space
fi

# Use yabai to focus the next space
$YABAI_PATH -m space --focus $next
