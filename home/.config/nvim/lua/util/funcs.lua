--[[
   _   _         __     _____ __  __ 
  | \ | | ___  __\ \   / /_ _|  \/  |
  |  \| |/ _ \/ _ \ \ / / | || |\/| |
  | |\  |  __/ (_) \ V /  | || |  | |
  |_| \_|\___|\___/ \_/  |___|_|  |_|
   _   _ _____ ___ _     
  | | | |_   _|_ _| |    
  | | | | | |  | || |    
  | |_| | | |  | || |___ 
   \___/  |_| |___|_____|
   _____ _   _ _   _  ____ ____  
  |  ___| | | | \ | |/ ___/ ___| 
  | |_  | | | |  \| | |   \___ \ 
  |  _| | |_| | |\  | |___ ___) |
  |_|    \___/|_| \_|\____|____/ 


  This file provides functions for the various actions. It is mostly here as a
  wrapper to make setting up keybinds simpler without having to worry about 
  logic for a given command. If some functionality is not available of if the
  action requires complex behaviour then we handle that here.
--]]

-- This is a small wrapper around the require() function which attempts to
-- include a module. But if it does not exist then instead of failing, we
-- return nil.
local function require_or_nil (modname)
    local ok, result = pcall(require, modname)
    if not ok then
        return nil
    end

    return result
end

local telescope = require_or_nil 'telescope.builtin'
local gitsigns = require_or_nil 'gitsigns'
local neogit = require_or_nil 'neogit'

local M = {}

M.general = {
    live_grep = function ()
        if telescope then
            telescope.live_grep()
        else
            vim.notify('live grep not available', vim.log.levels.ERROR)
        end
    end,

    search_resume = function ()
        if telescope then
            telescope.resume()
        else
            vim.notify('search resume not available', vim.log.levels.ERROR)
        end
    end,

    -- TODO the "z=" keybind also takes a count which selects the item from the
    --      the list of spelling suggestions.
    spell_suggestion = function()
        if telescope then
            telescope.spell_suggest()
        else
            vim.cmd('normal! z=')
        end
    end,
}


M.search_diagnostics = function ()
    if telescope then
        telescope.diagnostics()
    else
        vim.notify('search diagnostics not available', vim.log.levels.ERROR)
    end
end

M.find = {
    files = function ()
        if telescope then
            telescope.find_files()
        else
            vim.notify('find files not available', vim.log.levels.ERROR)
        end
    end,

    recent_files = function ()
        if telescope then
            telescope.oldfiles()
        else
            vim.notify('find recent files not available', vim.log.levels.ERROR)
        end
    end,
}

M.buffers = function ()
    if telescope then
        telescope.buffers()
    else
        vim.notify('buffers not available', vim.log.levels.ERROR)
    end
end

M.history = {
    command = function ()
        if telescope then
            telescope.command_history()
        else
            vim.cmd('normal! q/')
        end
    end,

    search_fwd = function ()
        if telescope then
            telescope.search_history()
        else
            vim.cmd('normal! q/')
        end
    end,
}

M.lsp_references = function ()
    if telescope then
        telescope.lsp_references()
    else
        vim.lsp.buf.references()
    end
end

M.lsp_definitions = function ()
    if  telescope then
        telescope.lsp_definitions()
    else
        vim.lsp.buf.type_definition()
    end
end

M.lsp_implementations = function ()
    if telescope then
        telescope.lsp_implementations()
    else
        vim.lsp.buf.implementation()
    end
end

M.lsp_document_symbols = function ()
    if telescope then
        telescope.lsp_document_symbols()
    else
        vim.lsp.buf.document_symbols()
    end
end

M.help = {
    autocommands = function ()
        if telescope then
            telescope.autocommands()
        else
            vim.notify('auto commands help not available', vim.log.levels.ERROR)
        end
    end,

    man_pages = function ()
        if telescope then
            telescope.man_pages()
        else
            vim.notify('man pages help not available', vim.log.levels.ERROR)
        end
    end,

    highlights = function ()
        if telescope then
            telescope.highlights()
        else
            vim.notify('highlights help not available', vim.log.levels.ERROR)
        end
    end,

    keymaps = function ()
        if telescope then
            telescope.keymaps()
        else
            vim.notify('keymaps help not available', vim.log.levels.ERROR)
        end
    end,

    help_tags = function ()
        if telescope then
            telescope.help_tags()
        else
            vim.notify('help tags not available', vim.log.levels.ERROR)
        end
    end,
}

M.git = {
    blame = function ()
        if gitsigns then
            gitsigns.blame()
        else
            vim.notify('blame not available', vim.log.levels.ERROR)
        end
    end,

    stage_hunk = function ()
        if gitsigns then
            gitsigns.stage_hunk()
        else
            vim.notify('stage hunk not available', vim.log.levels.ERROR)
        end
    end,

    reset_hunk = function ()
        if gitsigns then
            gitsigns.reset_hunk()
        else
            vim.notify('reset hunk not available', vim.log.levels.ERROR)
        end
    end,

    preview_hunk = function ()
        if gitsigns then
            gitsigns.preview_hunk()
        else
            vim.notify('preview hunk not available', vim.log.levels.ERROR)
        end
    end,

    dashboard = function ()
        if neogit then
            neogit.open()
        else
            vim.notify('Neogit not available', vim.log.levels.ERROR)
        end
    end,
}

return M
