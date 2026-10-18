--[[
   _   _         __     _____ __  __
  | \ | | ___  __\ \   / /_ _|  \/  |
  |  \| |/ _ \/ _ \ \ / / | || |\/| |
  | |\  |  __/ (_) \ V /  | || |  | |
  |_| \_|\___|\___/ \_/  |___|_|  |_|
   _   _ _____ ___ _
  | | | |_   _|_ _| |
  | | | | | |  | || |
  | |_| | | |  | || |___
   \___/  |_| |___|_____|
   ____   _  _____ _   _ ____
  |  _ \ / \|_   _| | | / ___|
  | |_) / _ \ | | | |_| \___ \
  |  __/ ___ \| | |  _  |___) |
  |_| /_/   \_\_| |_| |_|____/
--]]

local M = {}

-- This is using some linux specifi paths so will not work on Windows.
local home_dir      = vim.env['HOME']
local desktop_dir   = vim.env['XDG_DESKTOP_DIR'] or vim.fs.joinpath(home_dir, 'Desktop')
local documents_dir = vim.env['XDG_DESKTOP_DIR'] or vim.fs.joinpath(home_dir, 'Documents')
local downloads_dir = vim.env['XDG_DOWNLOAD_DIR'] or vim.fs.joinpath(home_dir, 'Downloads')
local music_dir     = vim.env['XDG_MUSIC_DIR'] or vim.fs.joinpath(home_dir, 'Music')
local pictures_dir  = vim.env['XDG_PICTURES_DIR'] or vim.fs.joinpath(home_dir, 'Pictures')
local projects_dir  = vim.env['XDG_PROJECTS_DIR'] or vim.fs.joinpath(home_dir, 'Projects')
local public_dir    = vim.env['XDG_PUBLICSHARE_DIR'] or vim.fs.joinpath(home_dir, 'Public')
local templates_dir = vim.env['XDG_TEMPLATES_DIR'] or vim.fs.joinpath(home_dir, 'Templates')
local videos_dir    = vim.env['XDG_VIDEOS_DIR'] or vim.fs.joinpath(home_dir, 'Videos')

M.home = home_dir
M.xdg = {
    desktop   = desktop_dir,
    documents = documents_dir,
    downloads = downloads_dir,
    music     = music_dir,
    pictures  = pictures_dir,
    projects  = projects_dir,
    public    = public_dir,
    templates = templates_dir,
    videos    = videos_dir,
}

return M
