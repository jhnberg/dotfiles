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
    ____ ___  _   _ _____ ___ ____ 
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _ 
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
--]]

vim.pack.add({
    {
        src = "https://github.com/gentoo/gentoo-syntax",
        version = "v16"
    },
    {
        src = "https://github.com/tpope/vim-fugitive",
        version = "v3.7"
    },
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = "v0.2.2"
    },
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "v0.1.4"
    },
    {
        src = "https://github.com/sphamba/smear-cursor.nvim",
        version = "v0.6.0"
    },
})
