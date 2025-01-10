local dap = require("dap")
dap.adapters.dart = {
  type = "executable",
  command = "dart",
  args = { "debug_adapter" },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Flutter App",
    program = "${workspaceFolder}/lib/main.dart",
  },
}

