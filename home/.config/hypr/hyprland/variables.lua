--[[
   _   ___   ______  ____  _        _    _   _ ____  
  | | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \ 
  | |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
  |  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
  |_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
  __     ___    ____  ___    _    ____  _     _____ ____  
  \ \   / / \  |  _ \|_ _|  / \  | __ )| |   | ____/ ___| 
   \ \ / / _ \ | |_) || |  / _ \ |  _ \| |   |  _| \___ \ 
    \ V / ___ \|  _ < | | / ___ \| |_) | |___| |___ ___) |
     \_/_/   \_\_| \_\___/_/   \_\____/|_____|_____|____/ 
--]]

local catppuccin_mocha = {
    rosewater = '#F5E0DC',
    flamingo  = '#F2CDCD',
    pink      = '#F5C2E7',
    mauve     = '#CBA6F7',
    red       = '#F38BA8',
    maroon    = '#EBA0AC',
    peach     = '#FAB387',
    yellow    = '#F9E2AF',
    green     = '#A6E3A1',
    teal      = '#94E2D5',
    sky       = '#89DCEB',
    sapphire  = '#74C7EC',
    blue      = '#89B4FA',
    lavender  = '#B4BEFE',
    text      = '#CDD6F4',
    subtext1  = '#bac2de',
    subtext0  = '#A6ADC8',
    overlay2  = '#9399B2',
    overlay1  = '#7F849C',
    overlay0  = '#6C7086',
    surface2  = '#585B70',
    surface1  = '#45475A',
    surface0  = '#313244',
    base      = '#1E1E2E',
    mantle    = '#181825',
    crust     = '#11111B',
}

local M = {
    applications = {
        email_client = 'thunderbird',
        file_manager = 'thunar',
        launcher = '~/.local/bin/app-launcher.sh',
        logout = '~/.local/bin/power-menu.sh',
        office_suite = 'libreoffice',
        switcher = '~/.local/bin/app-switcher.sh',
        terminal = 'alacritty',
        web_browser = 'google-chrome-stable',
    },
    workspaces = {
        persistent = {
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
        }
    },
    colours = catppuccin_mocha,
}

return M
