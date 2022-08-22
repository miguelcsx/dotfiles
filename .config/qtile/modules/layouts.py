from libqtile import layout
from libqtile.config import Match
from libqtile.layout import columns
from .theme import colors

layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 4,
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    layout.Bsp(**layout_conf),
    layout.Columns(**layout_conf),
    #layout.Matrix(columns=2,**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.MonadThreeCol(**layout_conf),
    layout.RatioTile(**layout_conf),
    #layout.Slice(),
    #layout.Spiral(**layout_conf),
    layout.Stack(**layout_conf),
    layout.Tile(**layout_conf),
    #layout.TreeTab(**layout_conf),
    #layout.VerticalTile(**layout_conf),
    #layout.Zoomy(**layout_conf),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ],
    border_focus=colors["color4"][0]
)
