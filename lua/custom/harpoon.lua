return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Harpoon depends on plenary.nvim
  },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    -- Toggle Harpoon menu
    { "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Menu" },

    -- Add file to Harpoon
    { "<leader>ha", function() require("harpoon.mark").add_file() end,        desc = "Add file to Harpoon" },

    -- Navigate to specific Harpoon marks
    { "<leader>h1", function() require("harpoon.ui").nav_file(1) end,         desc = "Go to Harpoon mark 1" },
    { "<leader>h2", function() require("harpoon.ui").nav_file(2) end,         desc = "Go to Harpoon mark 2" },
    { "<leader>h3", function() require("harpoon.ui").nav_file(3) end,         desc = "Go to Harpoon mark 3" },
    { "<leader>h4", function() require("harpoon.ui").nav_file(4) end,         desc = "Go to Harpoon mark 4" },

    -- Navigate through Harpoon marks sequentially
    { "<leader>hn", function() require("harpoon.ui").nav_next() end,          desc = "Go to next Harpoon mark" },
    { "<leader>hN", function() require("harpoon.ui").nav_prev() end,          desc = "Go to previous Harpoon mark" },

    -- Clear Harpoon marks
    { "<leader>hc", function() require("harpoon.mark").clear_all() end,       desc = "Clear all Harpoon marks" },

    -- Remove the current file from Harpoon
    { "<leader>hd", function() require("harpoon.mark").rm_file() end,         desc = "Remove current file from Harpoon" },
  },
  config = function()
    require("harpoon").setup({
      menu = {
        width = 60,  -- Width of the Harpoon menu for better visibility
        height = 10, -- Height of the Harpoon menu to show enough entries
      },
      global_settings = {
        save_on_toggle = true,                -- Automatically save the Harpoon list when toggling the menu
        save_on_change = true,                -- Save changes to the list immediately
        enter_on_sendcmd = false,             -- Don’t automatically enter the terminal after sending a command
        excluded_filetypes = { "gitcommit" }, -- Exclude certain filetypes
      },
    })
  end,
}
