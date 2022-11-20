
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

opt.relativenumber = true
opt.wrap = true
opt.termguicolors = true
require('plugins')
require('pconf.tree-sitter-cfg')

