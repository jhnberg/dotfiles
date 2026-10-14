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
            _     _      _           _
  __      _| |__ (_) ___| |__       | | _____ _   _
  \ \ /\ / / '_ \| |/ __| '_ \ _____| |/ / _ \ | | |
   \ V  V /| | | | | (__| | | |_____|   <  __/ |_| |
    \_/\_/ |_| |_|_|\___|_| |_|     |_|\_\___|\__, |
                                              |___/
--]]

local ok, which_key = pcall(require, 'which-key')
if not ok then
    vim.notify('which-key not found', vim.log.levels.DEBUG)
    return
end

-- Only active which-key if the leader key is pressed, the reasoning here is
-- that which-key will hijack the showcmd buffer where the keystrokes are
-- usually shown. I would like it to be a little less intrusive as this is good
-- feedback, then ideally which-key could popup after a few seconds to help
-- with suggestions. But there seem to be no easy way to do this, hence we just
-- trigger which-key on the leader key as this is where the custom kemaps are.

which_key.setup({
    preset = 'modern',
    show_help = true,
    show_keys = true,
    triggers = { '<leader>' },
})
