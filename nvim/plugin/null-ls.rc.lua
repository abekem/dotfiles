if vim.g.vscode then return end
local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local cspell_config_dir
local cspell_config_filename
if vim.fn.has "mac" == 1 then
  cspell_config_dir = '~/.config/cspell'
  cspell_config_filename = '/cspell-mac.json'
end
if vim.fn.has "win32" == 1 then
  cspell_config_dir = vim.env.LOCALAPPDATA .. '/cspell'
end
if vim.fn.has "unix" == 1 then return end
local cspell_files = {
  config = vim.call('expand', cspell_config_dir .. '/cspell.json'),
  dotfiles = vim.call('expand', cspell_config_dir .. '/dotfiles.txt'),
  user = vim.call('expand', cspell_config_dir .. '/user.txt'),
}

local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  }),
  null_ls.builtins.diagnostics.fish,
  --null_ls.builtins.formatting.google_java_format,
  null_ls.builtins.diagnostics.cspell.with({
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severity = vim.diagnostic.severity["WARN"]
    end,
    condition = function()
      return vim.fn.executable('cspell') > 0
    end,
    -- 起動時に設定ファイル読み込み
    extra_args = { '--config', cspell_files.config }
  })
}

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

-- cspell の辞書登録コマンド
local cspell_append = function(opts)
  local word = opts.args
  if not word or word == "" then
    -- 引数がなければcwordを取得
    word = vim.call('expand', '<cword>'):lower()
  end

  -- bangの有無で保存先を分岐
  local dictionary_name = opts.bang and 'dotfiles' or 'user'

  -- shellのechoコマンドで辞書ファイルに追記
  io.popen('echo ' .. word .. ' >> ' .. cspell_files[dictionary_name])

  -- 追加した単語および辞書を表示
  vim.notify(
    '"' .. word .. '" is appended to ' .. dictionary_name .. ' dictionary.',
    vim.log.levels.INFO,
    {}
  )

  -- cspellをリロードするため、現在行を更新してすぐ戻す
  if vim.api.nvim_get_option_value('modifiable', {}) then
    vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
    vim.api.nvim_command('silent! undo')
  end
end

vim.api.nvim_create_user_command(
  'CSpellAppend',
  cspell_append,
  { nargs = '?', bang = true }
)

-- cspellのカスタムアクションを追加
local cspell_custom_actions = {
  name = 'append-to-cspell-dictionary',
  method = null_ls.methods.CODE_ACTION,
  filetypes = {},
  generator = {
    fn = function(_)
      -- 現在のカーソル位置
      local lnum = vim.fn.getcurpos()[2] - 1
      local col = vim.fn.getcurpos()[3]

      -- 現在行のエラーメッセージ一覧
      local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

      -- カーソル位置にcspellの警告が出ているか探索
      local word = ''
      local regex = '^Unknown word %((%w+)%)$'
      for _, v in pairs(diagnostics) do
        if v.source == "cspell" and
            v.col < col and col <= v.end_col and
            string.match(v.message, regex) then
          -- 見つかった場合、単語を抽出
          word = string.gsub(v.message, regex, '%1'):lower()
          break
        end
      end

      -- 警告が見つからなければ終了
      if word == '' then
        return
      end

      -- cspell_appendを呼び出すactionのリストを返却
      return {
        {
          title = 'Append "' .. word .. '" to user dictionary',
          action = function()
            cspell_append({ args = word })
          end
        },
        {
          title = 'Append "' .. word .. '" to dotfiles dictionary',
          action = function()
            cspell_append({ args = word, bang = true })
          end
        }
      }
    end
  }
}

-- null_lsに登録
null_ls.register(cspell_custom_actions)
