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
 ___ _ __ ___   ___  __ _ _ __  ___ _   _ _ __ ___  ___  _ __
/ __| '_ ` _ \ / _ \/ _` | '__|/ __| | | | '__/ __|/ _ \| '__|
\__ \ | | | | |  __/ (_| | |  | (__| |_| | |  \__ \ (_) | |
|___/_| |_| |_|\___|\__,_|_|___\___|\__,_|_|  |___/\___/|_|
                          |_____|
--]]

local ok, smear_cursor = pcall(require, 'smear_cursor')
if not ok then
    vim.notify('smear_cursor could not be found', vim.log.levels.DEBUG)
    return
end

smear_cursor.setup({
    stiffness                      = 0.95,
    stiffness_insert_mode          = 1.0,
    trailing_stiffness             = 0.4,
    trailing_stiffness_insert_mode = 0.9,
    damping                        = 0.99,
    damping_insert_mode            = 0.99,
    distance_stop_animation        = 0.1,
})
