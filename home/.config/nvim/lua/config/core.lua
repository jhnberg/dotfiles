--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
    ____ ___  ____  _____
   / ___/ _ \|  _ \| ____|
  | |  | | | | |_) |  _|
  | |__| |_| |  _ <| |___
   \____\___/|_| \_\_____|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--

vim.g.mapleader      = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.opt.title          = true
vim.opt.titlestring    = "%t -- NeoVIM"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.expandtab      = true
vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4

vim.opt.spell     = true
vim.opt.spelllang = {
    "en_gb",
    "en_us",
    "sv"
}

vim.opt.timeout     = false
vim.opt.timeoutlen  = 0
vim.opt.ttimeoutlen = 0

vim.opt.completeopt = "menuone,noinsert,popup"

vim.opt.cursorline     = true
vim.opt.cursorlineopt  = 'number'

vim.diagnostic.config({
    virtual_text = true,
})

local modules = require('util/modules')
local smear_cursor = modules.include('smear_cursor')

if smear_cursor then
    smear_cursor.setup({
        stiffness                      = 0.95,
        stiffness_insert_mode          = 1.0,
        trailing_stiffness             = 0.4,
        trailing_stiffness_insert_mode = 0.9,
        damping                        = 0.99,
        damping_insert_mode            = 0.99,
        distance_stop_animation        = 0.1,
    })
end

require("theme/catppuccin").mocha.apply()

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
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Open git blame' })
vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Open NeoGit' })
