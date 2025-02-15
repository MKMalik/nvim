local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    ["<leader>fr"] = { ":FlutterRun<CR>", "Run Flutter App" },
    ["<leader>fq"] = { ":FlutterQuit<CR>", "Quit Flutter App" },
    ["<leader>fd"] = { ":FlutterDevices<CR>", "Select Flutter Device" },
  }
}

return M
