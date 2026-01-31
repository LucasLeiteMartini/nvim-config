local uname = vim.uv.os_uname()
local is_windows = uname.sysname == "Windows_NT"

-- Detect WSL
local is_wsl = false
if not is_windows then
  local proc_version = io.open("/proc/version", "r")
  if proc_version then
    local content = proc_version:read("*l")
    proc_version:close()
    if content and content:lower():match("microsoft") then
      is_wsl = true
    end
  end
end

-- Apply win32yank clipboard ONLY on Windows or WSL
if is_windows or is_wsl then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }

  vim.opt.clipboard = "unnamedplus"
else
  -- POSIX padrão (Linux/macOS)
  -- NÃO sobrescreve vim.g.clipboard
  vim.opt.clipboard = "unnamedplus"
end
