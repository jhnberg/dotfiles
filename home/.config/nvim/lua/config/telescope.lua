--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
   _____ _____ _     _____ ____   ____ ___  ____  _____
  |_   _| ____| |   | ____/ ___| / ___/ _ \|  _ \| ____|
    | | |  _| | |   |  _| \___ \| |  | | | | |_) |  _|
    | | | |___| |___| |___ ___) | |__| |_| |  __/| |___
    |_| |_____|_____|_____|____/ \____\___/|_|   |_____|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--


local ok, builtin = pcall(require, 'telescope.builtin')

if ok then
    vim.keymap.set('n', '<leader>ff',  builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fm',  builtin.marks, { desc = 'Telescope find marks' })
    vim.keymap.set('n', '<leader>fh',  builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fb',  builtin.buffers, { desc = 'Telescope find buffers' })
    vim.keymap.set('n', '<leader>fk',  builtin.keymaps, { desc = 'Telescope find keymaps' })
    vim.keymap.set('n', '<leader>fg',  builtin.grep_string, { desc = 'Telescope find patterns' })
    vim.keymap.set('n', '<leader>fF',  builtin.oldfiles, { desc = 'Telescope find old files' })
    vim.keymap.set('n', '<leader>fM',  builtin.man_pages, { desc = 'Telescope find man pages' })

    -- LSP
    vim.keymap.set('n', '<leader>fd',  builtin.diagnostics, { desc = 'Telescope find diagnostics' })
    vim.keymap.set('n', '<leader>fr',  builtin.lsp_references, { desc = 'Telescope find references' })

    -- Git
    vim.keymap.set('n', '<leader>fl',  builtin.git_commits, { desc = 'Telescope find commits' })
    vim.keymap.set('n', '<leader>fB',  builtin.git_branches, { desc = 'Telescope find branches' })
end
