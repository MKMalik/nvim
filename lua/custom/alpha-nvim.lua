return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional: for icons
  },
  lazy = false,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set up the dashboard header
    dashboard.section.header.val = {
      "                                                                ",
      "    ███╗   ███╗██╗  ██╗ ███╗   ███╗ █████╗ ██╗      ██╗██╗  ██╗ ",
      "    ████╗ ████║██║ ██╔╝ ████╗ ████║██╔══██╗██║      ██║██║ ██╔╝ ",
      "    ██╔████╔██║█████╔╝  ██╔████╔██║███████║██║      ██║█████╔╝  ",
      "    ██║╚██╔╝██║██╔═██╗  ██║╚██╔╝██║██╔══██║██║      ██║██╔═██╗  ",
      "    ██║ ╚═╝ ██║██║  ██╗ ██║ ╚═╝ ██║██║  ██║███████╗ ██║██║  ██╗ ",
      "    ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚═╝╚═╝  ╚═╝ "
    }

    -- Set up the dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("t", "  Tmux Configuration", ":e ~/.tmux.conf <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    -- Function to get the current date and time
    local function get_time()
      return os.date("%I:%M %p     %d %b %Y")
    end

    -- Set up the footer with live time
    dashboard.section.footer.val = "HOW HARD CAN YOU WORK? IT'S YOUR FACTOR."

    -- Update the footer every second
    vim.loop.new_timer():start(0, 1000, vim.schedule_wrap(function()
      dashboard.section.footer.val = get_time()
      alpha.redraw()
    end))
    -- Set up alpha configuration
    alpha.setup(dashboard.config)

    -- Automatically open alpha when Neovim starts with no files
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        if stats.count == 0 then
          vim.cmd("Alpha")
        end
      end,
    })
  end,
};
