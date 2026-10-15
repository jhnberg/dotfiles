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
vim.keymap.set('n', 'z=', funcs.spell_suggestion)
vim.keymap.set('n', 'grr', funcs.lsp_references)
vim.keymap.set('n', 'grt', funcs.lsp_definitions)
vim.keymap.set('n', 'gri', funcs.lsp_implementations)
vim.keymap.set('n', 'gO', funcs.lsp_document_symbols)
vim.keymap.set('n', 'q:', funcs.history_command)
vim.keymap.set('n', 'q/', funcs.history_search_fwd)

-- Custom keymaps
vim.keymap.set('n', '<leader>/', funcs.live_grep, {
    desc = 'Live grep',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>\'', funcs.search_resume, {
    desc = 'Resume searching',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>bb', funcs.buffers, {
    desc = 'Buffers',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>ff', funcs.find_files, {
    desc = 'Find files',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>fr', funcs.find_recent_files, {
    desc = 'Find recent files',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>h?', require('telescope.builtin').help_tags, {
    desc = 'Help tags',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>ha', funcs.help_autocommands, {
    desc = 'Autocommands',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>hk', funcs.help_keymaps, {
    desc = 'Keymaps',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>hm', funcs.help_man_pages, {
    desc = 'Man pages',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>hH', funcs.help_highlights, {
    desc = 'Highlights',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>gg', funcs.git_client, {
    desc = 'Git client',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>gb', funcs.blame, {
    desc = 'Blame',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>gs', funcs.stage_hunk, {
    desc = 'Stage a hunk',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>gR', funcs.reset_hunk, {
    desc = 'Reset a hunk',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>gh', funcs.preview_hunk, {
    desc = 'Preview a hunk',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', '<leader>sd', funcs.search_diagnostics, {
    desc = 'Search diagnostics',
    nowait = true,
    noremap = true,
})
