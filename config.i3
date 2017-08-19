set $mod Mod4

set $term terminator
set $browser firefox
set $music spotify
set $filem thunar
set $mixer pavucontrol

# is used in the bar {} block below.
font pango:xos4 Terminess Powerline Bold 10

# Catch NUM and CAPS Status
bindsym --release Caps_Lock exec pkill -SIGRTMIN+11 i3blocks
bindsym --release Num_Lock  exec pkill -SIGRTMIN+11 i3blocks

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec terminator

# kill focused window
bindsym $mod+Shift+q kill

# Programm launcher and Window switcher 
bindsym $mod+d exec rofi -show run
bindsym $mod+Shift+w exec rofi -show window
bindsym $mod+Shift+s exec rofi -show ssh

# Window focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move Windows
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+Shift+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child
#
# switch to workspace
bindsym $mod+1 workspace "1 "
bindsym $mod+2 workspace "2 "
bindsym $mod+3 workspace "3 "
bindsym $mod+4 workspace "4 "
bindsym $mod+5 workspace "5 "
bindsym $mod+6 workspace "6 "
bindsym $mod+7 workspace "7 "
bindsym $mod+8 workspace "8 "
bindsym $mod+9 workspace "9 "
bindsym $mod+0 workspace "10 "

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace "1 "
bindsym $mod+Shift+2 move container to workspace "2 "
bindsym $mod+Shift+3 move container to workspace "3 "
bindsym $mod+Shift+4 move container to workspace "4 "
bindsym $mod+Shift+5 move container to workspace "5 "
bindsym $mod+Shift+6 move container to workspace "6 "
bindsym $mod+Shift+7 move container to workspace "7 "
bindsym $mod+Shift+8 move container to workspace "8 "
bindsym $mod+Shift+9 move container to workspace "9 "
bindsym $mod+Shift+0 move container to workspace "10 "

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3blocks
        	colors {
		background #262626
		statusline #787878
		separator  #000000
	
		focused_workspace  #383333 #383333 #ab2b2b
		active_workspace   #333333 #333333 #888888
		inactive_workspace #333333 #333333 #888888
		urgent_workspace   #900000 #900000 #ab2b2b
	}
}


# Arch Window colors
client.focused          #383333 #383333 #dddddd
client.focused_inactive #333333 #333333 #888888
client.unfocused        #333333 #333333 #888888
client.urgent           #900000 #900000 #ffffff


# Windows Settings
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [title="Lautstärkeregler"] floating enable
for_window [title="Lautstärkeregler"] resize set 640 480
for_window [title="Spotify"] floating enable
for_window [title="Spotify"] resize set 1500 1500
for_window [title="Einstellungen*"] floating enable
for_window [title="KeePassX"] floating enable
for_window [title="KeePassX"] resize set 1024 860


# Running at startup
exec --no-startup-id nitrogen --restore
#turn off dpms display timeout
exec --no-startup-id xset s off -dpms 
exec --no-startup-id xset b off
exec --no-startup-id setxkbmap -layout de,ru -option grp:alt_caps_toggle -option grp_led:scroll
exec --no-startup-id xcompmgr -n -f -c -I -20 -O -20 -D 5

# Progamm Startup
bindsym $mod+f exec firefox
bindsym $mod+t exec thunderbird
bindsym $mod+n exec playerctl next
bindsym $mod+b exec playerctl previous
bindsym $mod+p exec playerctl play-pause
bindsym $mod+m exec pavucontrol
