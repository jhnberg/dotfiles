--[[
 _   ___   ______  ____  _        _    _   _ ____
| | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \
| |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
|  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
|_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
--]]

local colours = require('hyprland.variables').colours

hl.config {
    general = {
        border_size             = 2,
        gaps_in                 = 5,
        gaps_out                = 7,
        gaps_workspaces         = 0,
        layout                  = 'scrolling',
        no_focus_fallback       = false,
        resize_on_border        = true,
        extend_border_grab_area = 10,
        hover_icon_on_border    = true,
        allow_tearing           = false,
        resize_corner           = 1,
        col = {
            inactive_border = {
                colors = { colours.overlay0 }
            },
            active_border = {
                colors = {
                    colours.lavender,
                    colours.green
                },
                angle  = 270,
            },
            nogroup_border = {
                colors = { colours.overlay0 }
            },
            nogroup_border_active = {
                colors = { colours.peach }
            },
        },
        snap = {
            enabled        = true,
            window_gap     = 16,
            monitor_gap    = 8,
            border_overlap = true,
        },
    },
    ecosystem = {
        no_update_news  = false,
        no_donation_nag = false,
    },
    group = {
        auto_group                           = true,
        insert_after_current                 = true,
        focus_removed_window                 = true,
        drag_into_group                      = true,
        merge_groups_on_drag                 = true,
        merge_groups_on_groupbar             = true,
        merge_floated_into_tiled_on_groupbar = true,
        group_on_movetoworkspace             = false,
        col = {
            border_active = {
                colors = { colours.green },
            },
            border_inactive = {
                colors = { colours.overlay0 },
            },
            border_locked_active = {
                colors = { colours.lavender },
            },
            border_locked_inactive = {
                colors = { colours.overlay0 },
            },
        },
        groupbar =  {
            enabled                   = true,
            font_family               = 'roboto',
            font_size                 = 12,
            gradients                 = true,
            height                    = 16,
            indicator_height          = 0,
            stacked                   = false,
            priority                  = 3,
            render_titles             = true,
            scrolling                 = true,
            rounding                  = 8,
            gradient_rounding         = 8,
            round_only_edges          = true,
            gradient_round_only_edges = true,
            text_color                = colours.crust,
            gaps_in                   = 1,
            gaps_out                  = 4,
            col = {
                active          = {
                    colors = { colours.rosewater },
                },
                inactive        = {
                    colors = { colours.overlay0 },
                },
                locked_active   = {
                    colors = { colours.rosewater },
                },
                locked_inactive = {
                    colors = { colours.overlay0 },
                },
            },
        }
    },
    binds = {
        pass_mouse_when_bound       = false,
        scroll_event_delay          = 500,
        workspace_back_and_forth    = false,
        allow_workspace_cycles      = false,
        workspace_center_on         = 1,
        focus_preferred_method      = 0,
        ignore_group_lock           = false,
        movefocus_cycles_fullscreen = false,
        movefocus_cycles_groupfirst = true,
        disable_keybind_grabbing    = false,
        allow_pin_fullscreen        = false,

    },
    input = {
        -- Find legal values with:
        --
        -- localectl list-x11-keymap-models
        -- localectl list-x11-keymap-layout
        -- localectl list-x11-keymap-variants
        kb_layout                   = 'gb',
        numlock_by_default          = false,
        resolve_binds_by_sym        = false,
        repeat_rate                 = 20,
        repeat_delay                = 500,
        sensitivity                 = 0,
        force_no_accel              = false,
        left_handed                 = false,
        scroll_button               = 0,
        scroll_button_lock          = 0,
        scroll_factor               = 1.0,
        natural_scroll              = false,
        follow_mouse                = 1,
        follow_mouse_threshold      = 0.0,
        focus_on_close              = 0,
        mouse_refocus               = true,
        float_switch_override_focus = 1,
        special_fallthrough         = false,
        off_window_axis_events      = 1,
        emulate_discrete_scroll     = 1,

        touchpad = {
            disable_while_typing    = true,
            natural_scroll          = true,
            scroll_factor           = 1.0,
            middle_button_emulation = false,
            clickfinger_behavior    = false,
            drag_lock               = true,
            flip_x                  = false,
            flip_y                  = false,
            tap_and_drag            = true,
            tap_to_click            = true,
        }
    },
    misc = {
        disable_hyprland_logo            = true,
        disable_splash_rendering         = true,
        font_family                      = 'Roboto',
        force_default_wallpaper          = 0,
        vrr                              = 1,
        mouse_move_enables_dpms          = false,
        key_press_enables_dpms           = true,
        animate_manual_resizes           = false,
        animate_mouse_windowdragging     = false,
        disable_autoreload               = false,
        enable_swallow                   = true,
        swallow_regex                    = '^(Alacritty)$',
        focus_on_activate                = false,
        mouse_move_focuses_monitor       = true,
        allow_session_lock_restore       = false,
        background_color                 = 'rgba(FFFFFFFF)',
        close_special_on_empty           = false,
        exit_window_retains_fullscreen   = false,
        on_focus_under_fullscreen        = true,
        initial_workspace_tracking       = 2,
        middle_click_paste               = true,
        render_unfocused_fps             = 12,
        disable_xdg_env_checks           = false,
        disable_hyprland_guiutils_check  = false,
        lockdead_screen_delay            = 1000,
        enable_anr_dialog                = true,
        col = {
            splash = 'rgba(FFFFFFFF)',
        }
    }
}

-- Layouts
--
-- The scrolling layout is the default layout across workspaces, but other
-- layout may still be used on some workspaces.
hl.config {
    scrolling = {
        fullscreen_on_one_column = true,
        column_width             = 0.5,
        focus_fit_method         = 1,
        follow_focus             = true,
        follow_min_visible       = 0.75,
        explicit_column_widths   = 0.5, 0.667, 1.0,
        direction                = 'right',
    },
    dwindle = {
        force_split = false,
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor = 1.0,
        split_width_multiplier = true,
        default_split_ratio = 1.0,
        split_bias = false,
    }
}

require('hyprland.style')
require('hyprland.keybinds')
require('hyprland.windows')
require('hyprland.windows')
require('hyprland.workspaces')
require('hyprland.xwayland')
require('hyprland.autorun')
