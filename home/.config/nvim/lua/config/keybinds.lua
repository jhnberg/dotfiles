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

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
    desc = "Exit terminal mode"
})

-- Telescope keybinds
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').autocommands, { desc = 'Telescope find autocommands' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Telescope find old files' })
vim.keymap.set('n', '<leader>fm', require('telescope.builtin').marks, { desc = 'Telescope find marks' })
vim.keymap.set('n', '<leader>f?', require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fH', require('telescope.builtin').search_history, { desc = 'Telescope seach history' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope find buffers' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Telescope find keymaps' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep, { desc = 'Telescope find patterns' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').spell_suggest, { desc = 'Telescope find spelling suggestions' })
vim.keymap.set('n', '<leader>fM', require('telescope.builtin').man_pages, { desc = 'Telescope find man pages' })
vim.keymap.set('n', '<leader>f ', require('telescope.builtin').resume, { desc = 'Telescope resume last search' })
vim.keymap.set('n', '<leader>fS', require('telescope.builtin').lsp_workspace_symbols, { desc = 'Telescope find symbols' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Telescope find diagnostics' })
vim.keymap.set('n', '<leader>fl',  require('telescope.builtin').git_commits, { desc = 'Telescope find commits' })
vim.keymap.set('n', '<leader>fB',  require('telescope.builtin').git_branches, { desc = 'Telescope find branches' })

vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, {
    desc = 'Find references',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_definitions, {
    desc = 'Find definitions',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, {
    desc = 'Find implementations',
    nowait = true,
    noremap = true,
})

vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, {
    desc = 'Find document symbols',
    nowait = true,
    noremap = true,
})

-- Tree Sitter keybinds
vim.keymap.set('n', '<leader>t', ':InspectTree<CR>', { desc = 'Inspect the treesitter tree' })
vim.keymap.set('n', '<leader>i', ':Inspect<CR>', { desc = 'Inspect the treesitter highlighting' })

-- Git keybinds
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open NeoGit' })

local gitsigns = require 'gitsigns'

vim.keymap.set('n', '<leader>gb', gitsigns.blame, {
    desc = 'Open git blame'
})

vim.keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, {
    desc = 'Stage a hunk',
})

vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, {
    desc = 'Reset a hunk',
})

vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, {
    desc = 'Preview a hunk'
})
