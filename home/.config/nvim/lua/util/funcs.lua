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

local function coalesce(...)
    for _, fn in ipairs { ... } do
        if type(fn) == 'function' then
            return fn
        end
    end

    return nil
end

local function cmd(command)
    return function ()
        vim.cmd(command)
    end
end

local function error(message)
    return function ()
        vim.notify(message .. ' not available', vim.log.leves.ERROR)
    end
end

local M = {}

M.general = {
    live_grep        = coalesce(telescope and telescope.live_grep, error 'live_grep'),
    search_resume    = coalesce(telescope and telescope.resume, error 'search resume'),
    spell_suggestion =  function ()
        -- TODO the "z=" keybind also takes a count which selects the item from the
        --      the list of spelling suggestions.
        if telescope then
            telescope.spell_suggest()
        else
            vim.cmd('normal! z=')
        end
    end
}

M.search_diagnostics = coalesce(telescope and telescope.diagnostics, error 'search diagnostics')

M.find = {
    files        = coalesce(telescope and telescope.find_files, error 'find files'),
    recent_files = coalesce(telescope and telescope.oldfiles, error 'recent files')
}

M.buffers = coalesce(telescope and telescope.buffers, error 'buffers')
M.history = {
    command    = coalesce(telescope and telescope.command_history, cmd 'normal! q/'),
    search_fwd = coalesce(telescope and telescope.search_history, cmd 'normal! q/'),
}

M.lsp_references       = coalesce(telescope and telescope.lsp_references, vim.lsp.buf.references)
M.lsp_definitions      = coalesce(telescope and telescope.lsp_definitions, vim.lsp.buf.type_definition)
M.lsp_implementations  = coalesce(telescope and telescope.lsp_implementations, vim.lsp.buf.implementation)
M.lsp_document_symbols = coalesce(telescope and telescope.lsp_document_symbols, vim.lsp.buf.document_symbols)

M.help = {
    autocommands = coalesce(telescope and telescope.autocommands, error 'autocommands'),
    man_pages    = coalesce(telescope and telescope.man_pages, error 'man pages'),
    highlights   = coalesce(telescope and telescope.highlights, error 'highlights'),
    keymaps      = coalesce(telescope and telescope.keymaps, error 'keymaps'),
    help_tags    = coalesce(telescope and telescope.help_tags, error 'help tags')
}

M.git = {
    blame        = coalesce(gitsigns and gitsigns.blame, error 'blame'),
    stage_hunk   = coalesce(gitsigns and gitsigns.stage_hunk, error 'stage hunk'),
    reset_hunk   = coalesce(gitsigns and gitsigns.reset_hunk, error 'reset hunk'),
    preview_hunk = coalesce(gitsigns and gitsigns.preview_hunk, error 'preview hunk'),
    dashboard    = coalesce(neogit and neogit.open, error 'neogit')
}

return M
