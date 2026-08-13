local wezterm = require 'wezterm'

return {
  use_fancy_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  font = wezterm.font_with_fallback {
    'Monaco Nerd Font Mono',
    'Monaco',
  },
  audible_bell = "Disabled",
  font_size = 14.0,
  hide_tab_bar_if_only_one_tab = true,
  native_macos_fullscreen_mode = false,
  window_decorations = "RESIZE|TITLE",
}
