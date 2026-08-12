local wezterm = require 'wezterm'

return {
  -- use_fancy_tab_bar = false,
  use_fancy_tab_bar = true,
  window_frame = {
    font_size = 7.0,
  },
  window_close_confirmation = 'NeverPrompt',
  font = wezterm.font_with_fallback {
    'Monaco Nerd Font Mono',
    'Monaco',
  },

  font_size = 14.0,
  hide_tab_bar_if_only_one_tab = true,

  -- native_macos_fullscreen_mode = false,
  window_decorations = "RESIZE|TITLE",

  -- keys = {
  --   {
  --     key = 'Enter',
  --     mods = 'ALT',
  --     action = wezterm.action.ToggleFullScreen,
  --   },
  -- },

}
