local lspcfg = require('lspconfig')                                            -- lsp package for configuration
local completion = require('completion')                                       -- autocopmlete utility for lsp
local signature = require('lsp_signature')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
  signature.on_attach()

  local opts = { noremap=true, silent=true }
  local function bmap(a, b, c) vim.api.nvim_buf_set_keymap(bufnr, a, b, c, opts) end

  bmap('n', 'gD',        '<CMD>lua vim.lsp.buf.declaration()<CR>')             -- go to declaration    with lsp
  bmap('n', 'gd',        '<CMD>lua vim.lsp.buf.definition()<CR>')              -- go to definition     with lsp
  bmap('n', 'gi',        '<CMD>lua vim.lsp.buf.implementation()<CR>')          -- go to implementation with lsp
  bmap('n', 'gr',        '<CMD>lua vim.lsp.buf.references()<CR>')              -- list references      with lsp
  bmap('n', '<leader>r', '<CMD>lua vim.lsp.buf.rename()<CR>')                  -- rename an identifier with lsp
  bmap('n', 'K',         '<CMD>lua vim.lsp.buf.hover()<CR>')                   -- show hover data      with lsp
end

local servers = { 'clangd', 'gopls', 'jdtls' }
for _, srv in ipairs(servers) do
  lspcfg[srv].setup{ on_attach = on_attach }
end
