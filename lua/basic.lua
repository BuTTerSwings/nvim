-- utf-8
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'UTF-8'

-- keep 8 lines when move by hjkl
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- highlight current line
vim.wo.cursorline = true

-- number of line
vim.wo.number = true

-- autoload files when modifying by other editors
vim.o.autoread = true
vim.bo.autoread = true

-- auto text alignment
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- one tab == 2 space
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- use space to alternate tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- step when << >>
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- cmp only show at most 10 lines
vim.o.pumheight = 10

-- cursor blink
