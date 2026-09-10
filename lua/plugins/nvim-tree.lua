-- lua/plugins/nvim-tree.lua

-- disable netrw (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
  renderer = {
    group_empty = true, -- collapse folders that only contain another folder (e.g. src/main/com)
  },
}

local function is_floating(win)
  return vim.api.nvim_win_get_config(win).relative ~= ''
end

local function is_nvim_tree(win)
  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
  return bufname:match('NvimTree_') ~= nil
end

-- Close nvim-tree along with the last real buffer instead of leaving it as
-- the only window open when running :q on the last non-tree window.
vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local tree_wins, other_wins = {}, {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if is_nvim_tree(win) then
        table.insert(tree_wins, win)
      elseif not is_floating(win) then
        table.insert(other_wins, win)
      end
    end

    local closing_last_real_window = #other_wins == 1
    if closing_last_real_window and #tree_wins > 0 then
      for _, win in ipairs(tree_wins) do
        vim.api.nvim_win_close(win, true)
      end
    end
  end,
})
