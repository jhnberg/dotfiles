--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
   _     ____  ____
  | |   / ___||  _ \
  | |   \___ \| |_) |
  | |___ ___) |  __/
  |_____|____/|_|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--

vim.g.mapleader      = " "


-- Generic configuration common across every LSP
vim.lsp.config('*', {
    on_attach = function (client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true
        })
    end
})

local lsp_config = {
    clangd = {
        cmd = { 'clangd' },
        filetypes = { 'c','cc', 'cxx', 'cpp', 'h', 'hh', 'hxx', 'hpp' , 's'},
        root_markers = { '.clangd', 'compile_command.json' },
        capabilities = {
            textDocument = {
                semanticTokens = {
                    multilineTokenSupport = true,
                }
            }
        }
    },
    luals = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    },
    rust_analyzer = {
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_markers = { 'Cargo.toml', 'Cargo.lock' }
    },
    pylsp = {
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        root_markers = { }
    }
}

for k,v in pairs(lsp_config) do
    vim.lsp.config(k, v)
    vim.lsp.enable(k)
end
