local terminal = 'alacritty' -- defined before to be used in _cmd vars

local default = {
  modkey = 'Mod4',
  alt = 'Mod1',
  terminal = terminal,
  emacs = 'emacs',
  browser = 'brave',
  editor_cmd = terminal .. ' -e nvim',
  file_manager = 'nemo',
  file_manager_cmd = terminal .. ' -e ranger',
  multimedia = 'vlc',
}

return default
