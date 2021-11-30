-- local gruvbox = require'visimp.themes.gruvbox'
require'visimp'{
  defaults = {
    foldmethod = 'marker'
  },
  languages = {
    'c', 'python', 'latex', 'lua', 'html', 'css', 'javascript'
  },
  python = {
    lsp = 'pyright' -- Avoid installing pyright, use the system's default
  },
  lspsignature = {},
  theme = {'gruvbox-community/gruvbox', 'gruvbox', 'dark', 'gruvbox'}
  -- theme = gruvbox()
}
