from dbus import Interface
from libqtile import qtile, widget
from .theme import colors
from modules.keys import terminal
import os

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=15, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2
    )


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=15,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    powerline('color5', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color5'), scale=0.65),

    powerline('color4', 'color5'),

    icon(bg="color4", text=' '), # Icon: nf-fa-download

    widget.CheckUpdates(
        background=colors['color4'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates} ',
        update_interval=1800,
        custom_command='checkupdates',
	mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e yay -Syu')},
    ),

    powerline('color3', 'color4'),

    icon(bg="color3", text=' '),

    widget.Net(**base(bg='color3'), format='{down} ↓↑ {up} '),

    powerline('color2', 'color3'),

    widget.KeyboardLayout(**base(bg='color2'), configured_keyboards=['latam', 'us'], display_map={'latam': 'latam ', 'us': 'us '}),

    powerline('color1', 'color2'),

    icon(bg="color1", fontsize=15, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),

    widget.Systray(background=colors['dark'], padding=5),

    separator()

]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    powerline('color2', 'color1'),

    icon(bg="color2", text=' '),

    widget.CPU(**base(bg= 'color2'), format='{freq_current}GHz {load_percent}% '),

    powerline('color3', 'color2'),

    icon(bg="color3", text='溜'),

    widget.Memory(**base(bg= 'color3'), mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},fmt='{} '),

    powerline('color4', 'color3'),

    icon(bg="color4", text=' '),

    widget.Net(**base(bg='color4'), format='{interface}: {down} ↓↑ {up} '),

    powerline('color5', 'color4'),

    widget.Clock(**base(bg='color5'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color5'),

    separator(),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 15,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
