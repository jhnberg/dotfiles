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

vim.opt.modelineexpr = true
vim.opt.laststatus   = 3
vim.opt.statusline   = '%{%v:lua._StatusLineMain()%}'
--vim.opt.showcmdloc   = 'statusline'

local layout = {
    {
        '%f',
        '%(%r%m%)',
    },
    {
        '%{%v:lua._StatusLineDiagnostics()%}',
        '%S',
        '%Y',
        '%10(%l:%c%)',
    }
}

function _StatusLineMain()
    local groups = {}
    for index, group in ipairs(layout) do
        table.insert(groups, index, table.concat(group, ' '))
    end
    return string.format(' %s ', table.concat(groups, '%='))
end

function _StatusLineDiagnostics()
    local format = {
        {
            severity = vim.diagnostic.severity.INFO,
            format   = '%%#DiagnosticInfo#I: %d%%#world#',
        },
        {
            severity = vim.diagnostic.severity.HINT,
            format   ='%%#DiagnosticHint#H: %d%%#world#',
        },
        {
            severity = vim.diagnostic.severity.WARN,
            format   = '%%#DiagnosticWarn#W:%d%%#world#',
        },
        {
            severity = vim.diagnostic.severity.ERROR,
            format   = '%%#DiagnosticError#E: %d%%#world#',
        },
    }

    local diagnostics = vim.diagnostic.count(0, {
        severity = {
            vim.diagnostic.severity.HINT,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.ERROR,
        }
    })

    local output = {}
    for _, entry in ipairs(format) do
        local count = diagnostics[entry.severity] or 0
        if count ~= 0 then
            table.insert(output, string.format(entry.format, count))
        end
    end

    return table.concat(output, ' ')
end
