--[[
   _   ___   ______  ____  _        _    _   _ ____
  | | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \
  | |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
  |  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
  |_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
  __        _____  ____  _  ______  ____   _    ____ _____ ____
  \ \      / / _ \|  _ \| |/ / ___||  _ \ / \  / ___| ____/ ___|
   \ \ /\ / / | | | |_) | ' /\___ \| |_) / _ \| |   |  _| \___ \
    \ V  V /| |_| |  _ <| . \ ___) |  __/ ___ \ |___| |___ ___) |
     \_/\_/  \___/|_| \_\_|\_\____/|_| /_/   \_\____|_____|____/
--]]

local workspaces = require('hyprland.variables').workspaces

for _, id in ipairs(workspaces.persistent) do
    hl.workspace_rule({
        workspace = string.format('%i', id),
        persistent = true,
    })
end

hl.workspace_rule({
    workspace = 's[true]',
    layout = 'dwindle',
})

-- Adjust the gaps for workspaces with a single window
hl.workspace_rule({
    workspace = 'w[tv1]',
    gaps_out = 8,
    gaps_in = 0,
})

hl.workspace_rule({
    workspace = 'f[true]',
    gaps_out = 8,
    gaps_in = 0,
})
