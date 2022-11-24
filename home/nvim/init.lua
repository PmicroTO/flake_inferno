local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.relativenumber = true
opt.wrap = true
opt.termguicolors = true
opt.encoding = "utf-8"
opt.ignorecase = true
opt.splitright = true
opt.wrap = true
opt.splitbelow = true
g.mapleader = ' '
g.maplocalleader = ','
opt.wildmode = {'list', 'longest'}

require('plugins')
require('pconf.tree-sitter-cfg')
require('mappings')

cmd([[
autocmd BufWritePre * lua vim.lsp.buf.format{ async = true }
]])
