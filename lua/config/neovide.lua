-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.945
vim.g.transparency = 0.945
vim.g.neovide_background_color = "#ffff00" .. alpha()
vim.o.guifont = "FiraCode Nerd Font Mono:h12"

-- Scroll
vim.g.neovide_scroll_animation_length = 0.5
