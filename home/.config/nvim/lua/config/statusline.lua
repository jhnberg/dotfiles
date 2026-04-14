--[[
   _   _ _____ _____     _____ __  __
  | \ | | ____/ _ \ \   / /_ _|  \/  |
  |  \| |  _|| | | \ \ / / | || |\/| |
  | |\  | |__| |_| |\ V /  | || |  | |
  |_| \_|_____\___/  \_/  |___|_|  |_|
   ____ _____  _  _____ _   _ ____  _     ___ _   _ _____ 
  / ___|_   _|/ \|_   _| | | / ___|| |   |_ _| \ | | ____|
  \___ \ | | / _ \ | | | | | \___ \| |    | ||  \| |  _|  
   ___) || |/ ___ \| | | |_| |___) | |___ | || |\  | |___ 
  |____/ |_/_/   \_\_|  \___/|____/|_____|___|_| \_|_____|
    ____ ___  _   _ _____ ___ ____
   / ___/ _ \| \ | |  ___|_ _/ ___|
  | |  | | | |  \| | |_   | | |  _
  | |__| |_| | |\  |  _|  | | |_| |
   \____\___/|_| \_|_|   |___\____|
]]--

local lsp = require("util/lsp")

local layout = {
    left = {
        '%f',
        '%(%r%m%)',
    },
    centre = {
        '%(%{v:lua._StatusLineLspState()}%)',
    },
    right = {
        '%Y',
        '%10(%l:%c%)',
    }
}

function _StatusLineMain()
    local left = table.concat(layout.left, ' ')
    local centre = table.concat(layout.centre, ' ')
    local right = table.concat(layout.right, ' ')
    return string.format(' %s %%= %s %%= %s ', left, centre, right)
end

function _StatusLineLspState()
    local lsps = lsp.current_buf.get_active_lsps() or {}
    return table.concat(lsps, ',')
end

vim.opt.modelineexpr = true
vim.opt.statusline   = '%{%v:lua._StatusLineMain()%}'
