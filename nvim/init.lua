vim.opt.belloff     = "all"
vim.opt.number      = true
vim.opt.syntax      = "enable"
vim.opt.autoindent  = true
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.clipboard   = "unnamed"
vim.opt.background  = "dark"
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_keymap('i', '{', '{<CR>}<Esc>O', { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
