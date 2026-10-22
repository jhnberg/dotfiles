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

-- Disable spellchecking on terminals, otherwise we have some pretty weird
-- looking text.
vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Disable spellchecking on the terminal',
    group = vim.api.nvim_create_augroup('DisableSpellCheckOnTerminal', {
        clear = true
    }),
    pattern = "*",
    callback = function()
        vim.opt_local.spell = false
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Find and enable tree-sitter parsers',
    group = vim.api.nvim_create_augroup('ProbeTreeSitter', {
        clear = true,
    }),
    callback = function (args)
        local lang = args.match
        if vim.treesitter.language.add(lang) then
            if vim.treesitter.query.get(lang, 'folds') then
                -- If folds.scm is available then use tree-sitter for folding.
                vim.opt_local.foldmethod = 'expr'
                vim.opt_local.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
            end
            vim.treesitter.start(args.buf,  lang)
        end
    end
})
