local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    'Monaco Nerd Font Mono',
    'Monaco',
  },
  font_size = 14.0,
  hide_tab_bar_if_only_one_tab = true,
}
