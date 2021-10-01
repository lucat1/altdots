local vimp = require('vimp')
local lspcfg = require('lspconfig')                                            -- lsp package for configuration
local completion = require('completion')                                       -- autocopmlete utility for lsp
local saga = require('lspsaga')
local lspbuf = vim.lsp.buf

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)

  vimp.add_buffer_maps(function()
    vimp.nnoremap('gD', function() lspbuf.definition() end)                     -- go to declaration    with lsp
    vimp.nnoremap('gd', function() lspbuf.definition() end)                     -- go to definition     with lsp
    vimp.nnoremap('gi', function() lspbuf.implementation() end)                 -- go to implementation with lsp
    vimp.nnoremap('gr', function() lspbuf.references() end)                     -- list references      with lsp
    vimp.nnoremap('<leader>r', function() lspbuf.rename() end)                  -- rename an identifier with lsp
    vimp.nnoremap('<silent>K', function() require('lspsaga.hover').render_hover_doc() end)-- show hover data      with lsp
  end)

  if client.resolved_capabilities.document_formatting then
    -- TODO: autocomamnd or whatever to autoformat
  end
end

local servers = { 'clangd', 'gopls', 'jdtls', 'pyright' }
for _, srv in ipairs(servers) do
  lspcfg[srv].setup{ on_attach = on_attach }
end

saga.init_lsp_saga()
