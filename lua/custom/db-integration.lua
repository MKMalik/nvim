return {
  'tpope/vim-dadbod',                   -- Core plugin for database interaction
  lazy = false,
  cmd = { 'DBUI', 'DBUIToggle', 'DB' }, -- Load on these commands
  dependencies = {
    {
      'kristijanhusak/vim-dadbod-ui', -- UI for browsing databases
      lazy = false,
      cmd = { 'DBUI', 'DBUIToggle' }, -- Load on these commands
    },
    {
      'kristijanhusak/vim-dadbod-completion', -- Autocompletion for SQL
      lazy = false,
      -- ft = { 'sql', 'mysql', 'plsql' },       -- Load for SQL filetypes
    },
  },
  config = function()
    -- Configure vim-dadbod-ui
    vim.g.db_ui_show_help = 1                -- Show help text
    vim.g.db_ui_win_position = 'right'       -- Position of the DBUI window
    vim.g.db_ui_use_nerd_fonts = 1           -- Use Nerd Fonts for icons
    vim.g.db_ui_show_database_icon = 1       -- Show database icons
    vim.g.db_ui_force_echo_notifications = 1 -- Ensure notifications are shown
  end,
  -- Keybindings for db-ui
  vim.api.nvim_set_keymap('n', '<leader>Bb', ':DBUI<CR>',
    { noremap = true, silent = true, desc = 'Open Database UI' }),
  vim.api.nvim_set_keymap('n', '<leader>Bq', ':DBUIToggle<CR>',
    { noremap = true, silent = true, desc = 'Toggle Database UI' }),

  -- Autocommand to enable dadbod-completion for SQL files
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'sql', 'mysql', 'plsql' },
    callback = function()
      vim.cmd('setlocal omnifunc=vim_dadbod_completion#omni')
    end,
  }),
};
