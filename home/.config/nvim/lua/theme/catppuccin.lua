--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
    ____    _  _____ ____  ____  _   _  ____ ____ ___ _   _
   / ___|  / \|_   _|  _ \|  _ \| | | |/ ___/ ___|_ _| \ | |
  | |     / _ \ | | | |_) | |_) | | | | |  | |    | ||  \| |
  | |___ / ___ \| | |  __/|  __/| |_| | |__| |___ | || |\  |
   \____/_/   \_\_| |_|   |_|    \___/ \____\____|___|_| \_|
   _____ _   _ _____ __  __ _____
  |_   _| | | | ____|  \/  | ____|
    | | | |_| |  _| | |\/| |  _|
    | | |  _  | |___| |  | | |___
    |_| |_| |_|_____|_|  |_|_____|
]]--

local colours = require('util/colours');

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
    crust     = '#11111B'
}

local function derive_catppuccin_scheme(colours)
    return {
        normal          = { ctermbg = 'none', bg = 'none' },
        status_line     = { fg = colours.text, bg = colours.surface2 },
        inactive_border = { fg = colours.overlay0 },
        visual_mode     = { fg = colours.rosewater, bg = colours.overlay2 },
        popup           = { bg = colours.mantel },
        popup_selectecd = { fg = colours.rosewater, bg = colours.overlay2 },
        hint            = { fg = colours.lavender },
        info            = { fg = colours.teal },
        success         = { fg = colours.green },
        warning         = { fg = colours.yellow },
        error           = { fg = colours.red },
        linenr          = { fg = colours.overlay1 },
        linenr_active   = { fg = colours.lavender },
        search          = { fg = colours.surface0, bg = colours.teal },
        search_active   = { fg = colours.surface0, bg = colours.teal },
        added           = { fg = colours.green },
        removed         = { fg = colours.red },
        changed         = { fg = colours.blue },
        attributes      = { fg = colours.yellow },
        braces          = { fg = colours.overlay2 },
        builtin         = { fg = colours.red },
        comments        = { fg = colours.overlay2 },
        constants       = { fg = colours.peach },
        delimiter       = { fg = colours.overlay2 },
        escape          = { fg = colours.pink },
        functions       = { fg = colours.blue },
        keyword         = { fg = colours.mauve },
        macros          = { fg = colours.rosewater },
        numbers         = { fg = colours.peach },
        operators       = { fg = colours.sky },
        parameters      = { fg = colours.maroon },
        property        = { fg = colours.blue },
        strings         = { fg = colours.green },
        symbols         = { fg = colours.red },
        type            = { fg = colours.yellow },
        link            = { fg = colours.blue },
        heading1        = { fg = colours.red },
        heading2        = { fg = colours.peach },
        heading3        = { fg = colours.yellow },
        heading4        = { fg = colours.green },
        heading5        = { fg = colours.sapphire },
        heading6        = { fg = colours.lavender },
    }
end

local M = {
    mocha = {
        colours = catppuccin_mocha,
        apply = function ()
            colours.apply(derive_catppuccin_scheme(catppuccin_mocha))
        end
    }
}

return M
