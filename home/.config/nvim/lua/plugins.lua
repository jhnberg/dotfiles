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
    {
        src = "https://github.com/NeogitOrg/neogit.git",
        version = "v3.0.0"
    },
    {
        src = "https://github.com/sindrets/diffview.nvim.git",
        version = "main"
    },
    {
        src = "https://github.com/lewis6991/gitsigns.nvim.git",
        version = "v2.1.0"
    },
})

-- Automatically remove any plugins which are inactive. This is for the plugins
-- which are not mentioned in the vim.pack.add().
local inactive_pkgs = vim.iter(vim.pack.get())
    :filter(function (pkg) return not pkg.active end)
    :map(function (pkg) return pkg.spec.name end)
    :totable()

if next(inactive_pkgs) ~= nil
then
    vim.pack.del(inactive_pkgs)
end
