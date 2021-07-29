vim.cmd 'packadd paq-nvim'                                                     -- let nvim load paq
local paq = require'paq-nvim'.paq                                              -- package manager
local opt = require'util'.opt                                                  -- utility for setting vim options (vimscript's set)
local map = require'util'.map                                                  -- utility for creating keybinds (vimscript's *map)
local bmap = require'util'.bmap                                                -- utility for creating local buffer keybinds

local cmd = vim.cmd                                                            -- alias to execute vi commands
local vfn = vim.api.nvim_call_function                                         -- alias to get vim paths
local fn = vim.fn                                                              -- alias to call vi functions
local g = vim.g                                                                -- access to global `g` scope

paq {'savq/paq-nvim', opt=true}                                                -- let the package manager manage itself
paq 'lifepillar/vim-gruvbox8'                                                  -- gruvbox colorscheme (lighter weight plugin)
paq 'neovim/nvim-lspconfig'                                                    -- nvim builtin lsp configurations
paq 'nvim-lua/completion-nvim'                                                 -- autocomplete from the lsp
paq 'ray-x/lsp_signature.nvim'                                                 -- more autocomplete infos from lsp
paq 'terrortylor/nvim-comment'                                                 -- comment code blocks with a shortcut
paq 'famiu/feline.nvim'
paq 'nvim-lua/popup.nvim'                                                      -- popup utility for lua plugins
paq 'nvim-lua/plenary.nvim'                                                    -- various nvim utilities for telescope
paq 'nvim-telescope/telescope.nvim'                                            -- fuzzy finder and much more
paq 'nvim-treesitter/nvim-treesitter'                                          -- modern syntax hilighting

paq 'lervag/vimtex'                                                            -- *Tex writing utility
paq 'folke/zen-mode.nvim'                                                      -- distraction-free writing

opt('o', 'swapfile', false)                                                    -- do not use swap files
opt('o', 'backup', false)                                                      -- do not use backups
opt('o', 'writebackup', false)                                                 -- do not write backups
opt('o', 'undofile', true)                                                     -- use undo files
opt('o', 'undodir', vfn('stdpath', {"data"}) .. "/undo")                       -- set the undodir to $XDG_DATA/nvim/undo

opt('o', 'incsearch', true)                                                    -- search while typing (incrementally)
opt('o', 'hlsearch', false)                                                    -- do not hightlight searches 
opt('o', 'showmatch', false)                                                   -- do not show search matched words in files
opt('o', 'smartcase', true)                                                    -- ignore case when searching if everything is lowercase

opt('w', 'wrap', false)                                                        -- do not wrap lines
opt('w', 'number', true)                                                       -- add line numbers to the left gutter
opt('w', 'relativenumber', true)                                               -- make line numbers relative
opt('o', 'scrolloff', 5)                                                       -- leave n lines from the bottom while scrolling down
opt('o', 'sidescrolloff', 10)                                                  -- leave n lines frm the right while scrolling right
opt('w', 'colorcolumn', '80')                                                  -- show a column ruler at 80 chars
opt('o', 'updatetime', 50)                                                     -- make vim's updates quicker so it feels snappier
opt('o', 'hidden', true)                                                       -- don't show verbose messages on the bottom
opt('o', 'showmode', false)                                                    -- shows the mode in the status line

local indent = 2
opt('b', 'tabstop', indent)                                                    -- number of spaces each tab shows
opt('b', 'expandtab', true)                                                    -- use spaces when tab is hit
opt('b', 'shiftwidth', indent)                                                 -- size on an indent (< or >)
opt('b', 'smartindent', true)                                                  -- uses tabs/spaces wisely where needed

opt('o', 'termguicolors', true)                                                -- enable true colors in modern terminals
opt('o', 'background', 'dark')                                                 -- set whatever theme we have to dark
cmd 'colorscheme gruvbox8'                                                     -- set the colorscheme to gruvbox ofc
vim.g.gruvbox_transp_bg = 1

vim.opt.completeopt = 'menuone,noinsert,noselect'

vim.g.mapleader = ' '                                                          -- leader key for mappings
map('n', '<leader>p', "<CMD>lua require('telescope.builtin').find_files()<CR>")-- fuzzy file finder
map('n', '<leader>f', "<CMD>lua require('telescope.builtin').live_grep()<CR>") -- fuzzy file search

map('n', '<leader>z', "<CMD>ZenMode<CR>")                                      -- zen mode
map('n', '<leader>ll', "<CMD>VimtexCompile<CR>")                               -- vimtex compile toggle
map('n', '<leader>lc', "<CMD>VimtexClean<CR>")                                 -- vimtex compile clean

require'lsp'
require'line'
require('nvim_comment').setup()
