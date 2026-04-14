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
   _   _ _____ ___ _     ___ _______   __
  | | | |_   _|_ _| |   |_ _|_   _\ \ / /
  | | | | | |  | || |    | |  | |  \ V /
  | |_| | | |  | || |___ | |  | |   | |
   \___/  |_| |___|_____|___| |_|   |_|
]]--

local function get_all_lsps_on_buf(bufnr)
    local buf_clients = vim.lsp.get_clients { bufnr = bufnr }
    if (not buf_clients) then
        return nil
    end

    local active_lsps = {}
    for _, lsp_client in pairs(buf_clients) do
        table.insert(active_lsps, lsp_client.name)
    end

    return active_lsps
end


local M = {
    current_buf = {
        get_active_lsps = function ()
            return get_all_lsps_on_buf(0)
        end
    }
}

return M
