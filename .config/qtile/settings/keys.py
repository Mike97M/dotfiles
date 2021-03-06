# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"
terminal = "termite"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ Window Configs ------------
        # Switch between windows in current stack pane
        ([mod], "j", lazy.layout.down()),
        ([mod], "Down", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        ([mod], "Up", lazy.layout.up()),
        ([mod], "h", lazy.layout.left()),
        ([mod], "Left", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),
        ([mod], "Right", lazy.layout.right()),
        # Change window sizes (MonadTall)
        ([mod, "shift"], "l", lazy.layout.grow()),
        ([mod, "shift"], "h", lazy.layout.shrink()),
        # Toggle floating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        # Move windows up or down in current stack
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        ([mod, "shift"], "Tab", lazy.prev_layout()),
        # Kill window
        ([mod], "q", lazy.window.kill()),
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),
        # ([mod], "r", lazy.spawncmd()),
        # ------------ App Configs ------------
        # Menu
        # ([mod], "d", lazy.spawn("rofi -show drun -show-icons")),
        # ([mod], "w", lazy.spawn("rofi -show window -show-icons")),
        # ([mod, "shift"], "d", lazy.spawn("rofi -show")),
        # Browser
        # ([mod], "b", lazy.spawn("firefox")),
        # Apps
        # ([mod], "r", lazy.spawn(f"{terminal} -e ranger")),
        # ([mod], "p", lazy.spawn(f"{terminal} -e python")),
        # ([mod], "e", lazy.spawn("thunderbird")),
        # ([mod], "s", lazy.spawn("skypeforlinux")),
        # ([mod], "t", lazy.spawn("telegram-desktop")),
        # # Terminal
        # ([mod], "Return", lazy.spawn(terminal)),
        # Redshift
        # ([mod], "r", lazy.spawn("redshift -O 2400")),
        # ([mod, "shift"], "r", lazy.spawn("redshift -x")),
        # Screenshot
        # ([mod], "s", lazy.spawn("flameshot gui")),
        # ([], "Print", lazy.spawn("flameshot gui")),
        # ([mod], "print", lazy.spawn("flameshot gui")),
        # ------------ Hardware Configs ------------
        # Volume
        (
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ),
        (
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ),
        ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ]
]
