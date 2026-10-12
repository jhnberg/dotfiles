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

-- Telescope keybinds
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').autocommands, { desc = 'Telescope find autocommands' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fm', require('telescope.builtin').marks, { desc = 'Telescope find marks' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fH', require('telescope.builtin').search_history, { desc = 'Telescope seach history' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope find buffers' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Telescope find keymaps' })
vim.keymap.set('n', '<leader>f/', require('telescope.builtin').live_grep, { desc = 'Telescope find patterns' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').spell_suggest, { desc = 'Telescope find spelling suggestions' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = 'Telescope find old files' })
vim.keymap.set('n', '<leader>fM', require('telescope.builtin').man_pages, { desc = 'Telescope find man pages' })
vim.keymap.set('n', '<leader>f ', require('telescope.builtin').resume, { desc = 'Telescope resume last search' })
vim.keymap.set('n', '<leader>fS', require('telescope.builtin').lsp_workspace_symbols, { desc = 'Telescope find symbols' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Telescope find diagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = 'Telescope find references' })
vim.keymap.set('n', '<leader>fl',  require('telescope.builtin').git_commits, { desc = 'Telescope find commits' })
vim.keymap.set('n', '<leader>fB',  require('telescope.builtin').git_branches, { desc = 'Telescope find branches' })

-- Tree Sitter keybinds
vim.keymap.set('n', '<leader>ti', ':InspectTree<CR>', { desc = 'Inspect the treesitter tree' })
vim.keymap.set('n', '<leader>th', ':Inspect<CR>', { desc = 'Inspect the treesitter highlighting' })

-- Git keybinds
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = 'Open git blame' })
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open NeoGit' })
