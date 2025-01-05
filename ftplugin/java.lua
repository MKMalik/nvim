local jdtls = require("jdtls")

-- Set Java LSP configuration
local config = {
  cmd = { "jdtls" },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
}

-- Start or attach jdtls
jdtls.start_or_attach(config)

