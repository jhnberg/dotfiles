--[[
   _   ___   ______  ____  _        _    _   _ ____  
  | | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \ 
  | |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
  |  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
  |_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/ 
   _  _________   ______ ___ _   _ ____  ____  
  | |/ / ____\ \ / / __ )_ _| \ | |  _ \/ ___| 
  | ' /|  _|  \ V /|  _ \| ||  \| | | | \___ \ 
  | . \| |___  | | | |_) | || |\  | |_| |___) |
  |_|\_\_____| |_| |____/___|_| \_|____/|____/ 
--]]

local vi = {
    directions = {
        left = { 'LEFT', 'H' },
        right = { 'RIGHT', 'L' },
        up = { 'UP', 'K' },
        down = { 'DOWN', 'J' }
    },
}

local mouse = {
    lmb = 'mouse:272',
    rmb = 'mouse:273',
}

-- General navigation
for direction, keys in pairs(vi.directions) do
    for _, key in ipairs(keys) do
        hl.bind('SUPER + ' .. key, hl.dsp.focus { direction = direction }, {
            description = 'Move the focus ' .. direction
        })

        hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move { direction = direction }, {
            description = 'Move the active window ' .. direction
        })
    end
end

hl.bind('SUPER + COMMA', hl.dsp.layout 'move -col', {
    description = 'Move the focus to the previous column'
})

hl.bind('SUPER + mouse_down', hl.dsp.layout 'move -col', {
    description = 'Move the focus to the previous column',
    repeating = true
})

hl.bind('SUPER + PERIOD', hl.dsp.layout 'move +col', {
    description = 'Move the focus to the next column'
})

hl.bind('SUPER + mouse_up', hl.dsp.layout 'move +col', {
    description = 'Move the focus to the next column',
    repeating = true,
})

hl.bind('SUPER + ' .. mouse.lmb, hl.dsp.window.drag {}, {
    description = 'Move the active window using the mouse'
})

hl.bind('SUPER + ' .. mouse.rmb, hl.dsp.window.resize(), {
    description = 'Resize the active window using the mouse'
})

for _, id in ipairs(require('hyprland.variables').workspaces.persistent) do
    if id > 10 then
        break -- We don't have enough keys to bind anything beyond workspace 10
    end

    -- There isn't really a key 10 so we will use number 0 for this workspace.
    -- This makes sense as the other workspaces 1..9. So workspace 10 following
    -- makes sense.
    local key = string.format('%i', id % 10)

    hl.bind('SUPER + ' .. key, hl.dsp.focus { workspace = id }, {
        description = 'Move the focus to workspace ' .. id
    })

    hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move { workspace = id }, {
        description = 'Move the active window to workspace ' .. id
    })
end

hl.bind('SUPER + S', hl.dsp.workspace.toggle_special { workspace = 'scratch' }, {
    description = 'Toggle the special scratch workspace'
})

hl.bind('SUPER + SHIFT + S', hl.dsp.window.move { workspace = 'special:scratch' }, {
    description = 'Toggle the special scratch workspace'
})

hl.bind('ALT + TAB', function ()
        hl.dispatch(hl.dsp.window.cycle_next {})
        hl.dispatch(hl.dsp.window.bring_to_top {})
    end, {
    description = 'Cycle to the next window and bring it to the top'
})

-- TODO cycle previous window, 
-- hl.bind('ALT + SHIFT + TAB', function ()
--         hl.dispatch(hl.dsp.window.cycle_next {})
--         hl.dispatch(hl.dsp.window.bring_to_top {})
--     end, {
--     description = 'Cycle to the previous window and bring it to the top'
-- })

-- Applications
local applications = require('hyprland.variables').applications
hl.bind('SUPER + B', hl.dsp.exec_cmd(applications.web_browser), {
    description = 'Open the web browser'
})

hl.bind('SUPER + E', hl.dsp.exec_cmd(applications.file_manager), {
    description = 'Open the file manager'
})

hl.bind('SUPER + O', hl.dsp.exec_cmd(applications.office_suite), {
    description = 'Open the office suite'
})

hl.bind('SUPER + M', hl.dsp.exec_cmd(applications.email_client), {
    description = 'Open the email client'
})

hl.bind('SUPER + I', hl.dsp.exec_cmd('hyprpicker -a'), {
    description = 'Open the colour picker'
})

hl.bind('SUPER + SPACE', hl.dsp.exec_cmd(applications.launcher), {
    descriptione = 'Open the application launcher'
})

hl.bind('SUPER + RETURN', hl.dsp.exec_cmd(applications.terminal), {
    description = 'Open the terminal'
})

hl.bind('SUPER + TAB', hl.dsp.exec_cmd(applications.switcher), {
    description = 'Open the application switcher'
})

hl.bind('SUPER + ESCAPE', hl.dsp.exec_cmd(applications.logout), {
    description = 'Open the logout menu'
})

-- Functions
hl.bind('SUPER + D', hl.dsp.exec_cmd 'makoctl dismiss', {
    description = 'Dismiss the next notification'
})

hl.bind('SUPER + D', hl.dsp.exec_cmd 'makoctl dismiss --all', {
    description = 'Dismiss all notification'
})

hl.bind('SUPER + F', hl.dsp.window.fullscreen { action = 'toggle' }, {
    description = 'Toggle fullscreen on the active window',
})

hl.bind('SUPER + R', hl.dsp.submap 'resize', {
    description = 'Switch to the resize submap'
})

hl.bind('SUPER + G', hl.dsp.group.toggle {}, {
    description = 'Toggle grouping on  the active window'
})

hl.bind('SUPER + C', function()
        hl.dispatch(hl.dsp.window.float { action = 'on' })
        hl.dispatch(hl.dsp.window.center {})
    end, {
    description = 'Set the active window to floating and center it'
})

hl.bind('SUPER + X', function()
        hl.dispatch(hl.dsp.window.float { action = 'on' })
        hl.dispatch(hl.dsp.window.pin {})
    end, {
    description = 'Set the active window to floating and pin it'
})

hl.bind('SUPER + V', hl.dsp.window.float { action = 'toggle' }, {
    description = 'Toggle floating on the active window'
})

hl.bind('SUPER + W', hl.dsp.exec_cmd '~/.config/hypr/scripts/select-wallpaer.sh', {
    description = 'Select the wallpaper'
})

hl.bind('SUPER + Q', hl.dsp.window.close {}, {
    description = 'Close the active window'
})

hl.bind('SUPER + CTRL + L', hl.dsp.exec_cmd 'hyprlock', {
    description = 'Lock the session'
})

hl.bind('SUPER + CTRL + K', hl.dsp.window.pseudo {}, {
    description = 'Toggle psuedo mode'
})

hl.bind('SUPER + CTRL + J', function ()
        -- currently this only works with dwindle
        -- TODO change behaviour with different layout
        hl.dispatch(hl.dsp.layout 'togglesplit')
    end, {
    description = 'Toggle split mode'
})

hl.bind('SUPER + CTRL + H', hl.dsp.exec_cmd 'hyprctl reload', {
    description = 'Reload hyprland'
})

-- Global keybinds
-- These keybinds have special keys dedicated to them, so it does not make
-- sense to change their behaviour even when another submap is active.
hl.bind('PRINT', hl.dsp.exec_cmd 'grim', {
    description = 'Take a screenshot of the entire screen',
    submap_univeral = true,
})

hl.bind('SHIFT + PRINT', hl.dsp.exec_cmd 'grim -g "$(slurp)"', {
    description = 'Take a screenshot of a selected region',
})

hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'playerctl next', {
    description = 'Play next',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'playerctl prev', {
    description = 'Play previous',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'playerctl play-pause', {
    description = 'Toggle playing/pausing',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'playerctl play-pause', {
    description = 'Toggle playing/pausing',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+', {
    description = 'Raise the volume',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-', {
    description = 'Lower the volume',
    locked = true,
    submap_univeral = true,
})

hl.bind('XF86AudioMute', hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle', {
    description = 'Toggle mute/unmute audio',
    locked = true,
    repeating = true,
    submap_univeral = true,
})

hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle', {
    description = 'Toggle mute/unmute microphone',
    locked = true,
    repeating = true,
    submap_univeral = true,
})

hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'brightnessctl s 10%+', {
    description = 'Increase brightness',
    locked = true,
    repeating = true,
    submap_univeral = true,
})

hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'brightnessctl s 10%-', {
    description = 'Decrease brightness',
    locked = true,
    repeating = true,
    submap_univeral = true,
})

-- Submaps
hl.define_submap('resize', function ()
    for _, key in ipairs(vi.directions.left) do
        hl.bind(key, hl.dsp.window.resize { x = -10, y = 0, relative = true }, {
            description = 'Shrink the active windows horizontally'
        })
    end

    for _, key in ipairs(vi.directions.right) do
        hl.bind(key, hl.dsp.window.resize { x = 10, y = 0, relative = true }, {
            description = 'Expand the active windows horizontally'
        })
    end

    for _, key in ipairs(vi.directions.up) do
        hl.bind(key, hl.dsp.window.resize { x = 0, y = 10, relative = true }, {
            description = 'Expand the active windows vertically'
        })
    end

    for _, key in ipairs(vi.directions.down) do
        hl.bind(key, hl.dsp.window.resize { x = 0, y = -10, relative = true }, {
            description = 'Shrink the active windows vertically'
        })
    end

    hl.bind(mouse.lmb, hl.dsp.window.resize(), {
        description = 'Move the active window using the mouse'
    })

    hl.bind('catchall', hl.dsp.submap 'reset', {
        description = 'Exit the resize submap'
    })
end)

hl.define_submap('move', function ()
    -- This submap iss not necessary as we can use SUPER + direction to move a
    -- window in the default submap. But it is useful for more mouse driven
    -- interactions.
    for direction, keys in pairs(vi.directions) do
        for _, key in ipairs(keys) do
            hl.bind(key, hl.dsp.window.move { direction = direction }, {
                description = 'Move the active window ' .. direction
            })
        end
    end

    hl.bind(mouse.lmb, hl.dsp.window.drag(), {
        description = 'Move the active window with the mosue'
    })

    hl.bind('catchall', hl.dsp.submap 'reset', {
        description = 'Exit theh move submap'
    })
end)

hl.define_submap('kill', function ()
    -- This is mainly useful if operating the system with a mouse as we already
    -- have a keybind for closing windows. As such, there is no keybind to move
    -- into this submap as is would be entered through some other means by
    -- clicking.
    hl.bind(mouse.lmb, function ()
            hl.dispatch(hl.dsp.window.close {})
            hl.dispatch(hl.dsp.submap 'reset')
        end, {
        description = 'Close the active window and exit the kill submap'
    })

    hl.bind('catchall', hl.dsp.submap 'reset', {
        description = 'Exit the kill submap'
    })
end)
