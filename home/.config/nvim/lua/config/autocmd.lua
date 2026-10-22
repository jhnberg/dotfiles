--[[
   _   _         __     _____ __  __
  | \ | | ___  __\ \   / /_ _|  \/  |
  |  \| |/ _ \/ _ \ \ / / | || |\/| |
  | |\  |  __/ (_) \ V /  | || |  | |
  |_| \_|\___|\___/ \_/  |___|_|  |_|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
      _   _   _ _____ ___   ____ __  __ ____
     / \ | | | |_   _/ _ \ / ___|  \/  |  _ \
    / _ \| | | | | || | | | |   | |\/| | | | |
   / ___ \ |_| | | || |_| | |___| |  | | |_| |
  /_/   \_\___/  |_| \___/ \____|_|  |_|____/
--]]

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Automatically resize splits when the window is resized',
    group = vim.api.nvim_create_augroup('AutoResizeSplitOnVimResize', {
        clear = true
    }),
    pattern = '*',
    command = 'wincmd =',
})
