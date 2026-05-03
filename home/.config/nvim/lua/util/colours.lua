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
        ['Normal']                 = scheme.general.normal,
        ['Visual']                 = scheme.general.visual_mode,
        ['StatusLine']             = scheme.general.status_line,
        ['WinSeparator']           = scheme.border.inactive,
        ['CurSearch']              = scheme.general.search_active,
        ['Search']                 = scheme.general.search_inactive,
        ['LineNr']                 = scheme.general.linenr,
        ['CursorLineNr']           = scheme.general.linenr_active,

        -- Popup
        ['Pmenu']                  = scheme.popup.deselected,
        ['PmenuSel']               = scheme.popup.selected,

        -- Messages
        ['OkMsg']                  = scheme.message.success,
        ['ErrMsg']                 = scheme.message.warning,
        ['WarningMsg']             = scheme.message.error,
        ['ModeMsg']                = scheme.message.info,

        -- Diagnostics
        ['DiagnosticOK']           = scheme.message.success,
        ['DiagnosticHint']         = scheme.message.hint,
        ['DiagnosticInfo']         = scheme.message.info,
        ['DiagnosticWarn']         = scheme.message.warning,
        ['DiagnosticError']        = scheme.message.error,

        -- Diffs
        ['Added']                  = scheme.diff.added,
        ['Removed']                = scheme.diff.removed,
        ['Changed']                = scheme.diff.changed,

        -- Spelling
        ['SpellBad']               = scheme.spell.bad,
        ['SpellCap']               = scheme.spell.cap,
        ['SpellRare']              = scheme.spell.rare,
        ['SpellLocal']             = scheme.spell.regional,

        -- Base synatx highlighting
        ['Delimiter']              = scheme.syntax.delimiter,
        ['String']                 = scheme.syntax.string,
        ['Number']                 = scheme.syntax.numbers,
        ['Constant']               = scheme.syntax.constants,
        ['Character']              = scheme.syntax.constants,
        ['Boolean']                = scheme.syntax.constants,
        ['Float']                  = scheme.syntax.constants,
        ['Identifier']             = scheme.syntax.symbols,
        ['Function']               = scheme.syntax.functions,
        ['Conditional']            = scheme.syntax.keyword,
        ['Repeat']                 = scheme.syntax.keyword,
        ['Label']                  = scheme.syntax.keyword,
        ['Keyword']                = scheme.syntax.keyword,
        ['Exception']              = scheme.syntax.keyword,
        ['Operator']               = scheme.syntax.operators,
        ['PreProc']                = scheme.syntax.keyword,
        ['Include']                = scheme.syntax.keyword,
        ['Define']                 = scheme.syntax.keyword,
        ['PreCond']                = scheme.syntax.keyword,
        ['Macro']                  = scheme.syntax.macro,
        ['StorageClass']           = scheme.syntax.keyword,
        ['Type']                   = scheme.syntax.type,
        ['Structure']              = scheme.syntax.keyword,
        ['Typedef']                = scheme.syntax.keyword,

        -- Treesitter and LSP
        ['@attribute']             = scheme.syntax.attributes,
        ['@attribute.builtin']     = scheme.syntax.builtin,
        ['@comment']               = scheme.syntax.comments,
        ['@constant']              = scheme.syntax.constants,
        ['@constant.builtin']      = scheme.syntax.builtin,
        ['@constant.macro']        = scheme.syntax.macro,
        ['@function']              = scheme.syntax.functions,
        ['@function.builtin']      = scheme.syntax.builtin,
        ['@function.macro']        = scheme.syntax.macro,
        ['@keyword']               = scheme.syntax.keyword,
        ['@module.builtin']        = scheme.syntax.builtin,
        ['@number']                = scheme.syntax.numbers,
        ['@operator']              = scheme.syntax.operators,
        ['@punctuation.delimiter'] = scheme.syntax.delimiter,
        ['@punctuation.bracket']   = scheme.syntax.braces,
        ['@property']              = scheme.syntax.property,
        ['@string']                = scheme.syntax.string,
        ['@string.escape']         = scheme.syntax.escape,
        ['@tag.builtin']           = scheme.syntax.builtin,
        ['@type']                  = scheme.syntax.type,
        ['@type.builtin']          = scheme.syntax.builtin,
        ['@variable']              = scheme.syntax.symbols,
        ['@variable.parameter']    = scheme.syntax.parameters,
        ['@markup.link']           = scheme.syntax.link,
        ['@markup.heading.1']      = scheme.syntax.heading1,
        ['@markup.heading.2']      = scheme.syntax.heading2,
        ['@markup.heading.3']      = scheme.syntax.heading3,
        ['@markup.heading.4']      = scheme.syntax.heading4,
        ['@markup.heading.5']      = scheme.syntax.heading5,
        ['@markup.heading.6']      = scheme.syntax.heading6,
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
