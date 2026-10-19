--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

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

-- Disable spellchecking on terminals, otherwise we have some pretty weird
-- looking text.
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('TerminalSpellCheck', {
        clear = true
    }),
    pattern = "*",
    callback = function()
        vim.opt_local.spell = false
    end,
})

vim.opt.timeout     = false
vim.opt.timeoutlen  = 0
vim.opt.ttimeoutlen = 0

vim.opt.completeopt = "menuone,noinsert,popup"

vim.opt.cursorline     = true
vim.opt.cursorlineopt  = 'number'

vim.diagnostic.config({
    virtual_text = true,
})

require("theme/catppuccin").mocha.apply()

require 'config/keybinds'
require 'config/lsp'
require 'config/treesitter'
require 'config/statusline'
require 'config.neogit'
require 'config.which-key'
require 'config.smear_cursor'
