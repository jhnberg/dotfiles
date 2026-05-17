--[[
   _   ___   ______  ____  _        _    _   _ ____
  | | | \ \ / /  _ \|  _ \| |      / \  | \ | |  _ \
  | |_| |\ V /| |_) | |_) | |     / _ \ |  \| | | | |
  |  _  | | | |  __/|  _ <| |___ / ___ \| |\  | |_| |
  |_| |_| |_| |_|   |_| \_\_____/_/   \_\_| \_|____/
      _   _   _ _____ ___  ____  _   _ _   _
     / \ | | | |_   _/ _ \|  _ \| | | | \ | |
    / _ \| | | | | || | | | |_) | | | |  \| |
   / ___ \ |_| | | || |_| |  _ <| |_| | |\  |
  /_/   \_\___/  |_| \___/|_| \_\\___/|_| \_|
--]]

hl.on('hyprland.start', function ()
    hl.exec_cmd('hyprpm reload -n')
    hl.exec_cmd('hypridle')
    hl.exec_cmd('eww daemon')
    hl.exec_cmd('systemctl --user start hyprpolkitagent')
    hl.exec_cmd('systemctl --user start wireplumber')
    hl.exec_cmd('dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP')

    hl.exec_cmd('udiskie')

    hl.exec_cmd('steam -silent')
    hl.exec_cmd('corectrl --minimize-systray')
    hl.exec_cmd('discord --start-minimized')

    hl.exec_cmd('~/.config/hypr/scripts/setup-wallpaper.sh')
    hl.exec_cmd('~/.config/hypr/scripts/reload-waybar.sh')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Breeze-Dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
end)
