--[[
  _   _         __     _____ __  __ 
 | \ | | ___  __\ \   / /_ _|  \/  |
 |  \| |/ _ \/ _ \ \ / / | || |\/| |
 | |\  |  __/ (_) \ V /  | || |  | |
 |_| \_|\___|\___/ \_/  |___|_|  |_|
  ____  _             _
 |  _ \| |_   _  __ _(_)_ __  ___
 | |_) | | | | |/ _` | | '_ \/ __|
 |  __/| | |_| | (_| | | | | \__ \
 |_|   |_|\__,_|\__, |_|_| |_|___/                                     
               |___/
--]]

vim.pack.add({
    {
        src = "https://github.com/gentoo/gentoo-syntax",
        version = "master"
    },
    {
        src = "https://github.com/tpope/vim-fugitive",
        version = "master"
    },
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = "v0.2.2"
    },
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "v0.1.4"
    }
})
