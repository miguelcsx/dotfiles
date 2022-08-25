from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"
terminal = "alacritty"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

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
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # Change Keyboard
    ([mod], "i", lazy.widget["keyboardlayout"].next_keyboard()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox-developer-edition")),
    ([mod, "shift"], "b", lazy.spawn("brave")),

    # Code Editor
    ([mod], "c", lazy.spawn("code")),

    # File Explorer
    ([mod], "e", lazy.spawn("pcmanfm")),

    # Terminal
    ([mod], "Return", lazy.spawn(terminal)),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 5000")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([], "Print", lazy.spawn("gnome-screenshot --interactive")),

    # Backgrounds
    ([mod], "t", lazy.spawn("feh --bg-scale --randomize /usr/share/backgrounds/user/")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pamixer --decrease 5"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pamixer --increase 5"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pamixer --toggle-mute"
    )),

    # PowerMenu
    ([], "XF86PowerOff", lazy.spawn("/home/miguelcs/.config/rofi/powermenu.sh")),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
]]
