if vim.g.vscode then return end
local status, jdtls = pcall(require, "jdtls")
if (not status) then return end

local config
if vim.fn.has "macunix" then
  config = {
    -- cmd = { '/path/to/jdt-language-server/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  }
end
if vim.fn.has "win32" then
  config = {
    -- cmd = { '/path/to/jdt-language-server/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  }
end
if vim.fn.has "wsl" then
  config = {
    -- cmd = { '/path/to/jdt-language-server/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  }
end
jdtls.start_or_attach(config)
