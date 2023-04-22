-- leader
vim.g.mapleader = " "

-- enable map, keep silent
local opt = {
    noremap = true,
    silent = true
}

local pluginKeys = {}

local map = vim.api.nvim_set_keymap

-- cmdline
map('c', '<C-j>', '<C-n>', { noremap = false })
map('c', '<C-k>', '<C-p>', { noremap = false })

-- dashboard
map('n', '<leader>h', ":Dashboard<CR>", opt)

-- ctrl + / => comment
map('n', '<C-_>', 'gcc', { noremap =false })
map('v', '<C-_>', 'gcc', { noremap =false })

-- map('n', '<leader>j', '5j', opt)
-- map('n', '<leader>k', '5k', opt)

-- <C-?> is conflict to <C-?> in window warp
-- reset to <A-?> for quickly page warp
map('n', '<A-j>', '5j', opt)
map('n', '<A-k>', '5k', opt)

-- window warp
map('n', '<C-h>', "<C-w>h", opt)
map('n', '<C-j>', "<C-w>j", opt)
map('n', '<C-k>', "<C-w>k", opt)
map('n', '<C-l>', "<C-w>l", opt)

-- tab between pages
map('n', '<A-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<A-l>', ':BufferLineCycleNext<CR>', opt)
-- close buffers => vim-bbye
map('n', 'xc', ':Bdelete!<CR>', opt)
map('n', 'xx', ':Bdelete!<CR><cmd>close<CR>', opt)

-- split the windows
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
map('n', 'sc', '<C-w>c', opt)    -- close current window
map('n', 'so', '<C-w>o', opt)    -- close others
map('n', 's=', '<C-w>=', opt)

-- terminal
map('n', 'ss', ':terminal<CR>', opt)
map('n', 'stv', ':vsp | terminal<CR>', opt)
map('n', 'sth', ':sp | terminal<CR>', opt)

map('t', 'jj', '<C-\\><C-n>', opt)

-- map jj to esc in normal model
map('i', 'jj', "<Esc>", opt)

-- open nvim-tree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

-- indentation in visual mode 
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- custom nvim-tree keybindings list
pluginKeys.nvimTreeList = {
	-- { key = { '<CR>', 'o', '2-LeftMouse>' }, action = 'edit' },
	-- { key = { 'n' }, action = 'cd' },
	-- { key = { 'N' }, action = 'dir_up' },
	-- { key = 'v', action = 'vsplit' },
}

-- return all custom keybindings to needed lua configurations
return pluginKeys
