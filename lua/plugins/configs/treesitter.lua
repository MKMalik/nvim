local options = {
  ensure_installed = { "lua", "java" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true,
    disable = { "dart" },
  },
}

return options
