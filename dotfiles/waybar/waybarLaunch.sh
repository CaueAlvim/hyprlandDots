# ----------------------------------------------------- 
# Check if waybar-disabled file exists
# ----------------------------------------------------- 
if [ -f $HOME/.cache/waybar-disabled ] ;then 
    killall waybar
    pkill waybar
    exit 1 
fi

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar
pkill waybar
sleep 0.2

waybar & disown
sleep 0.2

notify-send "Waybar" "Reloaded successfully!"
