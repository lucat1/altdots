-- local lualine = require'lualine'

-- local config = {
  -- options = {
    -- -- section_separators = {'', ''},
    -- -- component_separators = {'', ''},
    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
    -- theme = 'gruvbox'
  -- }
-- }

-- lualine.setup(config)
local staline = require'staline'

local gruvbox = {
	n = "#a89985",
	i = "#84a598",
	c = "#8fbf7f",
	v = "#fc802d"
}

local no_unicode_modes = {
	n = "N ",
	i = "I ",
	c = "C ",
	v = "V "
}

local defaults = {
  left_separator   = "",
  right_separator  = ""
}

staline.setup{
  defaults = defaults,
  mode_colors = gruvbox,
  mode_icons = no_unicode_modes
}
