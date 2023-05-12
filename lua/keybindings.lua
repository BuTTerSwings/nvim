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
-- map('n', '<C-_>', 'gcc', { noremap =false })
-- map('v', '<C-_>', 'gcc', { noremap =false })



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
map('n', 'xo', ':BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>', opt)

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

-- noice
map('n', '<leader>n', ":Noice<CR>", opt)
-- trouble
map('n', '<leader>t', ":Trouble<CR>", opt)

-- custom nvim-tree keybindings list
-- have been deprecated
-- pluginKeys.nvimTreeList = {
	-- { key = { '<CR>', 'o', '2-LeftMouse>' }, action = 'edit' },
	-- { key = { 'n' }, action = 'cd' },
	-- { key = { 'N' }, action = 'dir_up' },
	-- { key = 'v', action = 'vsplit' },
-- }

-- telescope
map('n', '<C-f>', ':Telescope find_files<CR>', opt)
map('n', '<C-t>', ':Telescope live_grep<CR>', opt)
map('n', '<C-o>', ':Telescope oldfiles<CR>', opt)
map('n', '<C-m>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opt)
map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>", opt)
pluginKeys.mapTelescope = {
  i = {
    -- move
    ['<C-j>'] = 'move_selection_next',
    ['<C-k>'] = 'move_selection_previous',
    ['<C-n>'] = 'move_selection_next',
    ['<C-p>'] = 'move_selection_previous',

    -- history
    ['<Down>'] = 'cycle_history_next',
    ['<Up>'] = 'cycle_history_prev',

    -- close
    ['<C-c>'] = 'close',

    -- preview scroll
    ['<C-u>'] = 'preview_scrolling_up',
    ['<C-d>'] = 'preview_scrolling_down',

    -- whichkey
    ["<C-h>"] = "which_key"
  },
  n = {
    ['q'] = 'close',
  },
}

-- debug => dap
pluginKeys.mapDap = function ()

  -- quit
  map(
      'n',
      '<S-F5>',
      ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. '<C-w>o<CR>',
      opt
    )
  -- restart
  map('n', '<C-S-F5>', ":lua require'dap'.restart()<CR>", opt)

  -- start or continue
  map('n', '<F5>', ":lua require'dap'.continue()<CR>", opt)

  -- breakpoint
  map('n', '<F1>', ":lua require'dap'.toggle_breakpoint()<CR>", opt)
  map('n', '<F2>', ":lua require'dap'.clear_breakpoints()<CR>", opt)

  --  stepOver, stepOut, stepInto

  -- ignore sub functions as one step
  map('n', '<F10>', ":lua require'dap'.step_over()<CR>", opt)

  -- complete sub functions and turn to parent node
  map('n', '<S-F11>', ":lua require'dap'.step_out()<CR>", opt)

  -- step by step
  map('n', '<F11>', ":lua require'dap'.step_into()<CR>", opt)

  -- pop up
  map('n', '<F12>', ":lua require'dapui'.eval()<CR>", opt)

end

-- format
map('n', '<C-s>', ':Format<CR>', opt)

pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  return {
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"})
  }
end

pluginKeys.mapLsp = function(mapbuf)
  mapbuf('n', '<leader>s', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opt)
  mapbuf('n', 'cm', '<cmd>Lspsaga rename<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
  mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
  mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
  mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
  mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
  --mapbuf("n", '<C-n>', '<cmd>Lspsaga vim.lsp.buf.format<CR>', opt)
  --mapbuf("n", "<C-n>", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- return all custom keybindings to needed lua configurations
return pluginKeys
