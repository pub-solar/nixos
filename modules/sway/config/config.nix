{ config, pkgs, ... }:
''
  # Default config for sway
  #
  # Copy this to ~/.config/sway/config and edit it to your liking.
  #
  # Read `man 5 sway` for a complete reference.

  ### Variables
  #
  # Logo key. Use Mod1 for Alt.
  set $mod Mod4
  # Home row direction keys, like vim
  set $left j
  set $down k
  set $up i
  set $right l
  # Your preferred terminal emulator
  set $term ${config.pub-solar.sway.terminal}
  # Your preferred application launcher
  # Note: pass the final command to swaymsg so that the resulting window can be opened
  # on the original workspace that the command was run on.
  #set $menu dmenu_path | dmenu | xargs swaymsg exec bemenu-run --no-overlap

  default_border pixel 1

  ### Output configuration
  #
  # Default wallpaper (more resolutions are available in @datadir@/backgrounds/sway/)
  output * bg ~/.config/wallpaper.jpg fill

  ### Key bindings
  #
  # Basics:
  #
      # Start a terminal
      bindsym $mod+Return exec $term

      # Start a terminal
      bindsym $mod+Shift+Return exec sh -c '$term --working-directory $(wcwd)'

      # Kill focused window
      bindsym $mod+Shift+q kill

      # Drag floating windows by holding down $mod and left mouse button.
      # Resize them with right mouse button + $mod.
      # Despite the name, also works for non-floating windows.
      # Change normal to inverse to use left mouse button for resizing and right
      # mouse button for dragging.
      floating_modifier $mod normal

      # Reload the configuration file
      bindsym $mod+Ctrl+r reload

  #
  # Moving around:
  #
      # Move your focus around
      bindsym $mod+$left focus left
      bindsym $mod+$down focus down
      bindsym $mod+$up focus up
      bindsym $mod+$right focus right
      # Or use $mod+[up|down|left|right]
      bindsym $mod+Left focus left
      bindsym $mod+Down focus down
      bindsym $mod+Up focus up
      bindsym $mod+Right focus right

      # Move the focused window with the same, but add Shift
      bindsym $mod+Shift+$left move left
      bindsym $mod+Shift+$down move down
      bindsym $mod+Shift+$up move up
      bindsym $mod+Shift+$right move right
      # Ditto, with arrow keys
      bindsym $mod+Shift+Left move left
      bindsym $mod+Shift+Down move down
      bindsym $mod+Shift+Up move up
      bindsym $mod+Shift+Right move right
  #
  # Workspaces:
  #


      # Workspace names
      # to display names or symbols instead of plain workspace numbers you can use
      # something like: set $ws1 1:mail
      #                 set $ws2 2:
      set $ws1 1
      set $ws2 2
      set $ws3 3
      set $ws4 4
      set $ws5 5
      set $ws6 6
      set $ws7 7
      set $ws8 8
      set $ws9 9

      # Switch to workspace
      bindsym $mod+1 workspace 1
      bindsym $mod+2 workspace 2
      bindsym $mod+3 workspace 3
      bindsym $mod+4 workspace 4
      bindsym $mod+5 workspace 5
      bindsym $mod+6 workspace 6
      bindsym $mod+7 workspace 7
      bindsym $mod+8 workspace 8
      bindsym $mod+9 workspace 9
      # Move focused container to workspace
      bindsym $mod+Ctrl+1 move container to workspace $ws1
      bindsym $mod+Ctrl+2 move container to workspace $ws2
      bindsym $mod+Ctrl+3 move container to workspace $ws3
      bindsym $mod+Ctrl+4 move container to workspace $ws4
      bindsym $mod+Ctrl+5 move container to workspace $ws5
      bindsym $mod+Ctrl+6 move container to workspace $ws6
      bindsym $mod+Ctrl+7 move container to workspace $ws7
      bindsym $mod+Ctrl+8 move container to workspace $ws8
      bindsym $mod+Ctrl+9 move container to workspace $ws9
      # Move focused container to workspace and move focus with it
      bindsym $mod+Shift+1 move container to workspace 1; workspace $ws1
      bindsym $mod+Shift+2 move container to workspace 2; workspace $ws2
      bindsym $mod+Shift+3 move container to workspace 3; workspace $ws3
      bindsym $mod+Shift+4 move container to workspace 4; workspace $ws4
      bindsym $mod+Shift+5 move container to workspace 5; workspace $ws5
      bindsym $mod+Shift+6 move container to workspace 6; workspace $ws6
      bindsym $mod+Shift+7 move container to workspace 7; workspace $ws7
      bindsym $mod+Shift+8 move container to workspace 8; workspace $ws8
      bindsym $mod+Shift+9 move container to workspace 9; workspace $ws9
      # Note: workspaces can have any name you want, not just numbers.
      # We just use 1-10 as the default.

      #navigate workspaces next / previous
      bindsym $mod+Ctrl+Right workspace next
      bindsym $mod+Ctrl+Left workspace prev

      # workspace back and forth (with/without active container)
      workspace_auto_back_and_forth yes
      bindsym $mod+b workspace back_and_forth
      bindsym $mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth

  #
  # Layout stuff:
  #
      # Configure border style <normal|1pixel|pixel xx|none|pixel>
      default_border pixel 1
      default_floating_border normal

      # Hide borders
      hide_edge_borders none

      # Font for window titles. Will also be used by the bar unless a different font
      # is used in the bar {} block below.
      font xft:Hack 16

      # You can "split" the current object of your focus with
      # $mod+b or $mod+v, for horizontal and vertical splits
      # respectively.
      bindsym $mod+h splith; exec notify-send 'tile horizontally'
      bindsym $mod+v splitv; exec notify-send 'tile vertically'

      # Switch the current container between different layout styles
      bindsym $mod+s layout stacking
      bindsym $mod+w layout tabbed
      bindsym $mod+e layout toggle split

      # Make the current focus fullscreen
      bindsym $mod+f fullscreen

      # Toggle the current focus between tiling and floating mode
      bindsym $mod+Shift+space floating toggle

      # Swap focus between the tiling area and the floating area
      bindsym $mod+t focus mode_toggle

      # Move focus to the parent container
      bindsym $mod+a focus parent
      bindsym $mod+d focus child
  #
  # Scratchpad:
  #
      # Sway has a "scratchpad", which is a bag of holding for windows.
      # You can send windows there and get them back later.

      # Move the currently focused window to the scratchpad
      bindsym $mod+Shift+minus move scratchpad

      # Show the next scratchpad window or hide the focused scratchpad window.
      # If there are multiple scratchpad windows, this command cycles through them.
      bindsym $mod+minus scratchpad show
  #
  # Resizing containers:
  #
  mode "resize" {
      # left will shrink the containers width
      # right will grow the containers width
      # up will shrink the containers height
      # down will grow the containers height
      bindsym $left resize shrink width 10px
      bindsym $down resize grow height 10px
      bindsym $up resize shrink height 10px
      bindsym $right resize grow width 10px

      # Ditto, with arrow keys
      bindsym Left resize shrink width 10px
      bindsym Down resize grow height 10px
      bindsym Up resize shrink height 10px
      bindsym Right resize grow width 10px

      # Return to default mode
      bindsym Return mode "default"
      bindsym Escape mode "default"
  }
  bindsym $mod+r mode "resize"

  include ~/.config/sway/config.d/*''
