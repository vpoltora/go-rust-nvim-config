local uv = vim.uv or vim.loop
local state_dir = vim.fn.expand('$HOME/.local/state/nvim')
local socket = state_dir .. '/url-handler.sock'
local active_file = state_dir .. '/url-handler-active'

local function can_connect(path)
  local ok, chan = pcall(vim.fn.sockconnect, 'pipe', path, { rpc = true })
  if not ok or type(chan) ~= 'number' or chan <= 0 then
    return false
  end
  pcall(vim.fn.chanclose, chan)
  return true
end

local function ensure_url_handler_socket()
  vim.fn.mkdir(state_dir, 'p')

  local stat = uv and uv.fs_stat and uv.fs_stat(socket) or nil
  if stat and stat.type == 'socket' and not can_connect(socket) then
    pcall(os.remove, socket)
  end

  pcall(vim.fn.serverstart, socket)
end

local function write_active_server()
  local name = vim.v.servername
  if type(name) ~= 'string' or name == '' then
    return
  end

  local cwd = (uv and uv.cwd and uv.cwd()) or vim.fn.getcwd()
  pcall(vim.fn.writefile, { name, cwd, tostring(os.time()) }, active_file)
end

ensure_url_handler_socket()
write_active_server()

vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged', 'FocusGained' }, {
  callback = write_active_server,
})
