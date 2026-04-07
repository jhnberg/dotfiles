--[[
  _   _ _____ _____     _____ __  __
 | \ | | ____/ _ \ \   / /_ _|  \/  |
 |  \| |  _|| | | \ \ / / | || |\/| |
 | |\  | |__| |_| |\ V /  | || |  | |
 |_| \_|_____\___/  \_/  |___|_|  |_|
  _  _________   ______ ___ _   _ ____  ____
 | |/ / ____\ \ / / __ )_ _| \ | |  _ \/ ___|
 | ' /|  _|  \ V /|  _ \| ||  \| | | | \___ \
 | . \| |___  | | | |_) | || |\  | |_| |___) |
 |_|\_\_____| |_| |____/___|_| \_|____/|____/
]]--


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope find marks' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope find keymaps' })
vim.keymap.set('n', '<leader>fgl', builtin.git_commits, { desc = 'Telescope find commits' })
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, { desc = 'Telescope find branches' })
