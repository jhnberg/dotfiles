--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
   _____ ____  _____ _____ ____ ___ _____ _____ _____ ____
  |_   _|  _ \| ____| ____/ ___|_ _|_   _|_   _| ____|  _ \
    | | | |_) |  _| |  _| \___ \| |  | |   | | |  _| | |_) |
    | | |  _ <| |___| |___ ___) | |  | |   | | | |___|  _ <
    |_| |_| \_\_____|_____|____/___| |_|   |_| |_____|_| \_\
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--


vim.api.nvim_create_autocmd('FileType', {
    desc = 'Tree Sitter autocmd',
    callback = function (args)
        local lang = args.match
        if vim.treesitter.language.add(lang) then
            -- No need to do anything
            vim.treesitter.start(args.buf,  lang)
        end
    end
})

--[[
  Set folding automatically based on treesitte.

  TODO: It would be nice to rank the folding in order of preference e.g.

  1. LSP
  2. Tree Sitter
  3. Indent

  Or have a per language ranking.
--]]

vim.opt.foldenable = false
vim.opt.foldcolumn = '0'
vim.opt.foldlevel  = 10
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
