--[[
   _   _         __     _____ __  __ 
  | \ | | ___  __\ \   / /_ _|  \/  |
  |  \| |/ _ \/ _ \ \ / / | || |\/| |
  | |\  |  __/ (_) \ V /  | || |  | |
  |_| \_|\___|\___/ \_/  |___|_|  |_|
   _  _________   ______ ___ _   _ ____  ____  
  | |/ / ____\ \ / / __ )_ _| \ | |  _ \/ ___| 
  | ' /|  _|  \ V /|  _ \| ||  \| | | | \___ \ 
  | . \| |___  | | | |_) | || |\  | |_| |___) |
  |_|\_\_____| |_| |____/___|_| \_|____/|____/ 
    ____ ___  _   _ _____ ___ ____ 
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _ 
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
--]]

local funcs = require 'util.funcs'

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})

-- Override default keymaps but keep their intention to have them be familiar
vim.keymap.set('n', 'z=', funcs.general.spell_suggestion)
vim.keymap.set('n', 'grr', funcs.lsp_references)
vim.keymap.set('n', 'grt', funcs.lsp_definitions)
vim.keymap.set('n', 'gri', funcs.lsp_implementations)
vim.keymap.set('n', 'gO', funcs.lsp_document_symbols)
vim.keymap.set('n', 'q:', funcs.search.command_history)

-- Helper function for setting options on custom keymaps
local function desc (text)
    return {
        desc    = text,
        nowait  = true,
        noremap = true,
    }
end

-- Custom keymaps
vim.keymap.set('n', '<leader>/', funcs.search.live_grep, desc 'Live grep')
vim.keymap.set('n', '<leader>\'', funcs.search.resume, desc 'Resume searching')
vim.keymap.set('n', '<leader>bb', funcs.buffer.picker, desc 'Buffers')
vim.keymap.set('n', '<leader>b]', funcs.buffer.next, desc 'Next buffer')
vim.keymap.set('n', '<leader>b[', funcs.buffer.prev, desc 'Previous buffer')
vim.keymap.set('n', '<leader>bs', funcs.buffer.scratch, desc 'Scratch buffer')

vim.keymap.set('n', '<leader>ff', funcs.find.files, desc 'Find files')
vim.keymap.set('n', '<leader>fr', funcs.find.recent_files, desc 'Find recent files')
vim.keymap.set('n', '<leader>fH', funcs.find.in_home, desc 'Find Documents files')
vim.keymap.set('n', '<leader>fD', funcs.find.in_desktop, desc 'Find Desktop files')
vim.keymap.set('n', '<leader>fO', funcs.find.in_documents, desc 'Find files in Documents')
vim.keymap.set('n', '<leader>fT', funcs.find.in_templates, desc 'Find Templates files')
vim.keymap.set('n', '<leader>fW', funcs.find.in_downloads, desc 'Find Downloads files')
vim.keymap.set('n', '<leader>fS', funcs.find.in_public, desc 'Find Public files')
vim.keymap.set('n', '<leader>fM', funcs.find.in_music, desc 'Find Music files')
vim.keymap.set('n', '<leader>fV', funcs.find.in_videos, desc 'Find Videos files')
vim.keymap.set('n', '<leader>fI', funcs.find.in_pictures, desc 'Find Pictures files')
vim.keymap.set('n', '<leader>fP', funcs.find.in_projects, desc 'Find Projects files')

vim.keymap.set('n', '<leader>h?', require('telescope.builtin').help_tags, desc 'Help tags')
vim.keymap.set('n', '<leader>ha', funcs.help.autocommands, desc 'Autocommands')
vim.keymap.set('n', '<leader>hk', funcs.help.keymaps, desc 'Keymaps')
vim.keymap.set('n', '<leader>hm', funcs.help.man_pages, desc 'Man pages')
vim.keymap.set('n', '<leader>hH', funcs.help.highlights, desc 'Highlights')

vim.keymap.set('n', '<leader>gg', funcs.git.dashboard, desc 'Dashboard')
vim.keymap.set('n', '<leader>gb', funcs.git.blame, desc 'Blame')
vim.keymap.set('n', '<leader>gs', funcs.git.stage_hunk, desc 'Stage a hunk')
vim.keymap.set('n', '<leader>gR', funcs.git.reset_hunk, desc 'Reset a hunk')
vim.keymap.set('n', '<leader>gh', funcs.git.preview_hunk, desc 'Preview a hunk')

vim.keymap.set('n', '<leader>sd', funcs.search.diagnostics, desc 'Search diagnostics')
vim.keymap.set('n', '<leader>s/', funcs.search.history, desc 'Search history')
