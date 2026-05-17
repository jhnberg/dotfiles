--[[
   _   ___   ______  ____  _        _    _   _ ____
  | | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \
  | |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
  |  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
  |_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
  __        _____ _   _ ____   _____        ______
  \ \      / /_ _| \ | |  _ \ / _ \ \      / / ___|
   \ \ /\ / / | ||  \| | | | | | | \ \ /\ / /\___ \
    \ V  V /  | || |\  | |_| | |_| |\ V  V /  ___) |
     \_/\_/  |___|_| \_|____/ \___/  \_/\_/  |____/
--]]

hl.window_rule({
    match = {
        class = 'Alacritty'
    },
    tag = '+terminal',
})

hl.window_rule({
    match = {
        class = '^(Bitwarden)$',
    },
    tag = '+private',
})

hl.window_rule({
    name = 'no-screenshare-private-windows',
    match = {
        tag = 'private'
    },
    no_screen_share = true,
})

hl.window_rule({
    name = 'disable-alpha-terminal-on-fs-special-ws',
    match = {
        tag = 'terminal',
        workspace = 's[true]',
        fullscreen = true,
    },
    opacity = 1.0,
    opaque = true,
    force_rgbx = true,
})

hl.window_rule({
    name = 'gw2-no-decorations',
    match = {
        title = 'Guild Wars 2',
        float = true,
    },
    no_blur = true,
    decorate = false,
})
