local wezterm = require 'wezterm'
local act = wezterm.action

local cfg = {}

cfg.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 }

cfg.keys = {
  {
    key = 'r',
    mods = 'LEADER|CTRL',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
  {
    key = 't',
    mods = 'LEADER|CTRL',
    action = act.TogglePaneZoomState,
  },
  {
    key = 'P',
    mods = 'SHIFT|SUPER',
    action = act.ActivateCommandPalette,
  },
  {
    key = 'v',
    mods = 'LEADER|CTRL',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'b',
    mods = 'LEADER|CTRL',
    action = act.SplitPane {
      direction = "Down",
      command = {
        domain = 'CurrentPaneDomain',
      },
      size = { Percent = 30 },
    },
  },
  {
    key = 'h',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Left",
  },
  {
    key = 'j',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Down",
  },
  {
    key = 'k',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Up",
  },
  {
    key = 'l',
    mods = 'LEADER|CTRL',
    action = act.ActivatePaneDirection "Right",
  },
}

cfg.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape',     action = 'PopKeyTable' },
  },
}

return cfg
