if vim.g.vscode then return end
local status, im_select = pcall(require, "im_select")
if (not status) then return end

if vim.fn.has "macunix" == 1 then
  im_select.setup {

    -- IM will be set to `default_im_select` in `normal` mode
    -- For Windows/WSL, default: "1033", aka: English US Keyboard
    -- For macOS, default: "com.apple.keylayout.ABC", aka: US
    -- For Linux, default: "keyboard-us"
    -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name you preferred
    default_im_select   = "com.apple.keylayout.ABC",

    -- Set to 1 if you don't want restore IM status when `InsertEnter`
    set_previous_events = {},

    -- Can be binary's name or binary's full path,
    -- e.g. 'im-select' or '/usr/local/bin/im-select'
    -- For Windows/WSL, default: "im-select.exe"
    -- For macOS, default: "im-select"
    -- For Linux, default: "fcitx5-remote"
    default_command     = 'im-select'
  }
end
if vim.fn.has "win32" == 1 then

end
if vim.fn.has "wsl" == 1 then

end
