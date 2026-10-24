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


local paths = require 'util.paths'

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

local files = {
    find_in_cwd = telescope and telescope.find_files,
    find_recent = telescope and telescope.oldfiles,
    find_in_dir = function (path)
        if not telescope or not path or not vim.fn.isdirectory(path) then
            return nil
        end

        return function ()
            telescope.find_files {
                cwd = path
            }
        end
    end
}

local git = {
    blame        = gitsigns and gitsigns.blame,
    dashboard    = neogit and neogit.open,
    preview_hunk = gitsigns and gitsigns.preview_hunk,
    reset_hunk   = gitsigns and gitsigns.reset_hunk,
    stage_hunk   = gitsigns and gitsigns.stage_hunk,
}

local search = {
    command_history = telescope and telescope.command_history,
    diagnostics     = telescope and telescope.diagnostics,
    resume          = telescope and telescope.resume,
    history         = telescope and telescope.search_history,
    live_grep       = telescope and telescope.live_grep,
}

M.general = {
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

M.find = {
    files        = coalesce(files.find_in_cwd, error 'find files'),
    recent_files = coalesce(files.find_recent, error 'recent files'),
    in_home      = coalesce(files.find_in_dir(paths.home), error 'find home files'),
    in_desktop   = coalesce(files.find_in_dir(paths.xdg.desktop), error 'find desktop files'),
    in_documents = coalesce(files.find_in_dir(paths.xdg.documents), error 'find documents files'),
    in_downloads = coalesce(files.find_in_dir(paths.xdg.downloads), error 'find downloads files'),
    in_pictures  = coalesce(files.find_in_dir(paths.xdg.pictures), error 'find pictures files'),
    in_projects  = coalesce(files.find_in_dir(paths.xdg.projects), error 'find projects files'),
    in_public    = coalesce(files.find_in_dir(paths.xdg.public), error 'find public files'),
    in_templates = coalesce(files.find_in_dir(paths.xdg.templates), error 'find templates files'),
    in_videos    = coalesce(files.find_in_dir(paths.xdg.videos), error 'find videos files'),
    in_music     = coalesce(files.find_in_dir(paths.xdg.music), error 'find music files'),
}

M.buffer = {
    picker  = coalesce(telescope and telescope.buffers, error 'buffers'),
    prev    = '<cmd>bprevious<cr>',
    next    = '<cmd>next<cr>',
    scratch = function ()
        local width = math.ceil(vim.o.columns * 0.80)
        local height = math.ceil(vim.o.lines * 0.70)
        local scratch_buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_open_win(scratch_buf, true, {
            width    = width,
            height   = height,
            col      = math.floor((vim.o.columns - width) / 2),
            row      = math.floor((vim.o.lines - height) / 2),
            relative = 'editor',
            style    = 'minimal',
            border   = 'rounded'
        })
    end
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
    blame        = coalesce(git.blame, error 'git blame'),
    dashboard    = coalesce(git.dashboard, error 'git dashboard'),
    preview_hunk = coalesce(git.preview_hunk, error 'git preview hunk'),
    reset_hunk   = coalesce(git.reset_hunk, error 'git reset hunk'),
    stage_hunk   = coalesce(git.stage_hunk, error 'git stage hunk'),
}

M.search = {
    command_history = coalesce(search.command_history, cmd 'normal! q/'),
    diagnostics     = coalesce(search.diagnostics, error 'search diagnostics'),
    history         = coalesce(search.history, cmd 'normal! q:'),
    live_grep       = coalesce(search.live_grep, error 'search live grep'),
    resume          = coalesce(search.resume, error 'search resume'),
}

return M
