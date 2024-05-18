local wezterm = require 'wezterm'
local utils = require 'utils'

local mappings = require 'mappings'

local config = {
  font = wezterm.font 'Hack Nerd Font Mono',
  color_scheme = 'Tokyo Night Storm',
  font_size = 16,
  initial_cols = 125,
  initial_rows = 40,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  enable_scroll_bar = true,
  window_background_opacity = 0.90,
  macos_window_background_blur = 20,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}


return utils.merge({ config, mappings })
