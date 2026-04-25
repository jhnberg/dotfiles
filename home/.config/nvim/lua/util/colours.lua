--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
    ____ ___  _     ___  _   _ ____  ____
   / ___/ _ \| |   / _ \| | | |  _ \/ ___|
  | |  | | | | |  | | | | | | | |_) \___ \
  | |__| |_| | |__| |_| | |_| |  _ < ___) |
   \____\___/|_____\___/ \___/|_| \_\____/
   _   _ _____ ___ _     ___ _______   __
  | | | |_   _|_ _| |   |_ _|_   _\ \ / /
  | | | | | |  | || |    | |  | |  \ V /
  | |_| | | |  | || |___ | |  | |   | |
   \___/  |_| |___|_____|___| |_|   |_|
--]]

local function populate(scheme)
    local highlighting = {
        -- General
        ['Normal']                 = scheme.normal,
        ['Visual']                 = scheme.visual_mode,
        ['StatusLine']             = scheme.status_line,
        ['WinSeparator']           = scheme.inactive_border,

        -- Popup
        ['Pmenu']                  = scheme.popup,
        ['PmenuSel']               = scheme.popup_selected,

        -- Search
        ['CurSearch']              = scheme.active_seach,
        ['Search']                 = scheme.seach,

        -- Line Numbers
        ['LineNr']                 = scheme.linenr,
        ['CursorLineNr']           = scheme.linenr_active,

        -- Messages
        ['OkMsg']                  = scheme.success,
        ['ErrMsg']                 = scheme.warning,
        ['WarningMsg']             = scheme.error,
        ['ModeMsg']                = scheme.informational,

        -- Diagnostics
        ['DiagnosticOK']           = scheme.success,
        ['DiagnosticHint']         = scheme.hint,
        ['DiagnosticInfo']         = scheme.informational,
        ['DiagnosticWarn']         = scheme.warning,
        ['DiagnosticError']        = scheme.error,

        -- Treesitter and LSP
        ['@attribute']             = scheme.attributes,
        ['@attribute.builtin']     = scheme.builtin,
        ['@comment']               = scheme.comments,
        ['@constant']              = scheme.constants,
        ['@constant.builtin']      = scheme.builtin,
        ['@constant.macro']        = scheme.macro,
        ['@function']              = scheme.functions,
        ['@function.builtin']      = scheme.builtin,
        ['@function.macro']        = scheme.macro,
        ['@keyword']               = scheme.keyword,
        ['@module.builtin']        = scheme.builtin,
        ['@number']                = scheme.numbers,
        ['@operator']              = scheme.operators,
        ['@punctuation.delimiter'] = scheme.delimiter,
        ['@punctuation.bracket']   = scheme.braces,
        ['@property']              = scheme.property,
        ['@string']                = scheme.string,
        ['@string.escape']         = scheme.escape,
        ['@tag.builtin']           = scheme.builtin,
        ['@type']                  = scheme.type,
        ['@type.builtin']          = scheme.builtin,
        ['@variable']              = scheme.symbols,
        ['@variable.parameter']    = scheme.parameters,
        ['@markup.link']           = scheme.link,
        ['@markup.heading.1']      = scheme.heading1,
        ['@markup.heading.2']      = scheme.heading2,
        ['@markup.heading.3']      = scheme.heading3,
        ['@markup.heading.4']      = scheme.heading4,
        ['@markup.heading.5']      = scheme.heading5,
        ['@markup.heading.6']      = scheme.heading6,
    }


    return highlighting
end

local M = {
    apply = function(scheme)
        local highlighting = populate(scheme)
        for key, value in pairs(highlighting) do
            vim.api.nvim_set_hl(0, key, value)
        end
    end
}

return M
