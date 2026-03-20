if vim.g.vscode then return end
local status, jdtls = pcall(require, "jdtls")
if (not status) then return end

local config
if vim.fn.has "macunix" == 1 then return end
if vim.fn.has "wsl" == 1 then
  config = {
    -- cmd = { '/path/to/jdt-language-server/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  }
end
if vim.fn.has "win32" == 1 then
  vim.api.nvim_create_augroup("JavaFormat", {})
  local command_format = vim.api.nvim_create_autocmd("BufWritePre", {
    group = "JavaFormat",
    pattern = { "*.java" },
    callback = function() vim.lsp.buf.format { async = true } end
  })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = 'JavaFormat',
    callback = function() vim.api.nvim_del_autocmd(command_format) end
  })
  local root_markers = { ".gradle", "gradlew", ".git" }
  local root_dir = jdtls.setup.find_root(root_markers)
  local home = vim.env.HOME
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local workspace_dir = home .. "\\.cache\\jdtls\\workspace\\" .. project_name
  config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
      -- 💀
      'java', -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx2g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-javaagent:' .. vim.env.MASON .. '/packages/jdtls/lombok.jar',

      -- 💀
      '-jar', vim.env.MASON .. '/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
      -- Must point to the                                                     Change this to
      -- eclipse.jdt.ls installation                                           the actual version

      -- 💀
      '-configuration', vim.env.MASON .. '/packages/jdtls/config_win',
      -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
      -- Must point to the                      Change to one of `linux`, `win` or `mac`
      -- eclipse.jdt.ls installation            Depending on your system.

      -- 💀
      -- See `data directory configuration` section in the README
      '-data', workspace_dir
    },
    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      ['java.format.settings.url'] = root_dir .. "/eclipse-java-google-style.xml",
      ['java.format.settings.profile'] = "GoogleStyle",
      java = {
        autobuild = { enabled = false },
      }
    },
    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {}
    },
  }
end
jdtls.start_or_attach(config)
