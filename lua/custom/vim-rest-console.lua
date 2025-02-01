return {
  "diepm/vim-rest-console",
  ft = "rest",
  init = function()
    vim.cmd("autocmd BufRead,BufNewFile *.rest set filetype=rest")
    vim.g.vrc_output_buffer_name = "__OUTPUT__.json"
    vim.g.vrc_allow_header_file = 1
  end,
  config = function()
    -- Keybinding to execute requests
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rest",
      callback = function()
        vim.keymap.set("n", "<leader>rr", "<Plug>RestNvimRun", { buffer = true, desc = "Execute REST request" })
      end,
    })

    -- Automatically format JSON response
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "__OUTPUT__.json",
      callback = function()
        -- Check if jq exists
        if vim.fn.executable("jq") ~= 1 then
          vim.notify("jq not found! Install it first.", vim.log.levels.ERROR)
          return
        end

        -- Workaround: Add a small delay to ensure buffer is ready
        vim.defer_fn(function()
          -- Make buffer modifiable
          vim.cmd("setlocal modifiable")

          -- Get raw content
          local raw_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          if #raw_content == 0 then
            return
          end

          -- Format with jq
          local ok, formatted = pcall(function()
            return vim.fn.system(
              "jq .",
              table.concat(raw_content, "\n")
            )
          end)

          -- Handle errors
          if not ok or vim.v.shell_error ~= 0 then
            vim.notify("Failed to format JSON. Is the response valid?", vim.log.levels.ERROR)
            return
          end

          -- Update buffer
          vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(formatted, "\n"))

          -- Reset buffer settings
          vim.cmd("setlocal modified")
          vim.cmd("setlocal filetype=json") -- Enable syntax highlighting
        end, 100)                           -- 100ms delay
      end,
    })
  end,
}
