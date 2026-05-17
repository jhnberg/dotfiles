--[[
 _   ___   ______  ____  _        _    _   _ ____  
| | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \ 
| |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
|  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
|_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
 ____ _______   ___     _____ 
/ ___|_   _\ \ / / |   | ____|
\___ \ | |  \ V /| |   |  _|  
 ___) || |   | | | |___| |___ 
|____/ |_|   |_| |_____|_____|
--]]


hl.env('HYPRCURSOR_THEME', 'Catppuccin Mocha Dark')
hl.env('HYPRCURSOR_SIZE', 28)

hl.monitor({
    output = '',
    mode = 'preferred',
    position = 'auto',
    scale = 'auto',
})

hl.curve('linear', {
    type = 'bezier',
    points = {
        { 0, 0 },
        { 1, 1 },
    }
})

hl.curve('easeOutExpo', {
    type = 'bezier',
    points = {
        { 0.16, 1 },
        { 0.3, 1 },
    }
})

hl.animation({
    leaf = 'global',
    enabled = true,
    speed = 1,
    bezier = 'default'
})

hl.animation({
    leaf = 'windows',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'windowsIn',
    enabled = true,
    speed = 2,
    bezier = 'easeOutExpo',
    style = 'popin 50%',
})

hl.animation({
    leaf = 'windowsOut',
    enabled = true,
    speed = 2,
    bezier = 'easeOutExpo',
    style = 'popin 50%',
})

hl.animation({
    leaf = 'windowsMove',
    enabled = true,
    speed = 4,
    bezier = 'easeOutExpo',
    style = 'popin 50%',
})

hl.animation({
    leaf = 'layers',
    enabled = true,
    speed = 1,
    bezier = 'default'
})

hl.animation({
    leaf = 'layersIn',
    enabled = true,
    speed = 2,
    bezier = 'easeOutExpo',
    style = 'fade',
})

hl.animation({
    leaf = 'layersOut',
    enabled = true,
    speed = 2,
    bezier = 'easeOutExpo',
    style = 'fade',
})

hl.animation({
    leaf = 'fade',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'fadeIn',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeOut',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeSwitch',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeShadow',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeDim',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeDim',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'fadeLayersIn',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'fadeLayersOut',
    enabled = true,
    speed = 1,
    bezier = 'easeOutExpo',
})

hl.animation({
    leaf = 'border',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'borderangle',
    enabled = true,
    speed = 20,
    bezier = 'linear',
    style = 'loop',
})

hl.animation({
    leaf = 'workspaces',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'workspacesIn',
    enabled = true,
    speed = 2,
    bezier = 'easeOutExpo',
    style = 'slidefade 50%'
})

hl.animation({
    leaf = 'workspacesOut',
    enabled = true,
    speed = 4,
    bezier = 'easeOutExpo',
    style = 'slidefade 50%'
})

hl.animation({
    leaf = 'specialWorkspace',
    enabled = true,
    speed = 1,
    bezier = 'default',
})

hl.animation({
    leaf = 'specialWorkspaceIn',
    enabled = true,
    speed = 4,
    bezier = 'easeOutExpo',
    style = 'slidefadevert 50%'
})

hl.animation({
    leaf = 'specialWorkspaceOut',
    enabled = true,
    speed = 4,
    bezier = 'easeOutExpo',
    style = 'slidefadevert 50%'
})

hl.layer_rule({
    name = 'rofi-animation',
    match = {
        namespace = 'rofi'
    },
    animation = 'slide',
})

hl.layer_rule({
    name = 'logout-animation',
    match = {
        namespace = 'logout_dialog'
    },
    animation = 'fade',
    dim_around = true,
    blur = true,
})

hl.layer_rule({
    name = 'notifications-animation',
    match = {
        namespace = 'notifications'
    },
    animation = 'slide',
})

local colours = require('hyprland.variables').colours

hl.window_rule({
    name = 'single-window-noanim',
    match = {
        workspace = 'w[tv1]',
        float = false,
    },
    animation = 'border off',
    border_color = colours.overlay0,
})

hl.window_rule({
    name = 'fullscreen-window-noanim',
    match = {
        workspace = 'f[true]',
        float = false,
    },
    animation = 'border off',
    border_color = colours.overlay0,
})

hl.config({
    animations = {
        enabled = true,
    },
    decoration = {
        rounding = 5,
        active_opacity = 1.0,
        inactive_opacity = 0.95,
        fullscreen_opacity = 1.0,
        dim_inactive = true,
        dim_strength = 0.2,
        dim_special = 0.4,
        dim_around = 0.4,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            ignore_opacity = true,
            new_optimizations = true,
            xray = false,
            noise = 0.05,
            contrast = 0.9,
            brightness = 0.9,
            vibrancy = 0.15,
            vibrancy_darkness = 0.0,
            special = true,
            popups = true,
            popups_ignorealpha = 0.2,
        },
        shadow = {
            enabled = true,
        }
    },
    render = {
        direct_scanout = 2,
        expand_undersized_textures = true,
        xp_mode = false,
        ctm_animation = 2,
        new_render_scheduling = true,
    },
    cursor = {
        sync_gsettings_theme = true,
        no_hardware_cursors = 2,
        no_break_fs_vrr = 2,
        min_refresh_rate = 24,
        hotspot_padding = 1,
        inactive_timeout = 0,
        no_warps = false,
        persistent_warps = true,
        warp_on_change_workspace = false,
        warp_back_after_non_mouse_input = false,
        zoom_factor = 1.0,
        enable_hyprcursor = true,
        hide_on_key_press = false,
        hide_on_touch = false,
        use_cpu_buffer = 2,
    }
})
