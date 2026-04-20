local M = {}

local function current_action_name()
  local cword = vim.fn.expand("<cword>")
  local line_action = vim.api.nvim_get_current_line():match("^%s*def%s+([%w_]+)")

  if line_action and (cword == "" or cword == "def") then
    return line_action
  end

  if cword ~= "" then
    return cword
  end

  return line_action
end

local function controller_context(path)
  local root, controller = path:match("^(.*)/app/controllers/(.+)_controller%.rb$")
  if not root or not controller then
    return nil
  end

  return {
    root = root,
    controller = controller,
    view_dir = root .. "/app/views/" .. controller,
  }
end

local function view_context(path)
  local root, view_dir, file = path:match("^(.*)/app/views/(.+)/([^/]+)$")
  if not root or not view_dir or not file then
    return nil
  end

  local action = file:match("^([^.]+)")
  if not action then
    return nil
  end

  local segments = vim.split(view_dir, "/", { plain = true })
  for i = #segments, 1, -1 do
    local controller = table.concat(segments, "/", 1, i)
    local controller_file = root .. "/app/controllers/" .. controller .. "_controller.rb"
    if vim.fn.filereadable(controller_file) == 1 then
      return {
        root = root,
        controller = controller,
        controller_file = controller_file,
        action = action:gsub("^_", ""),
      }
    end
  end

  return {
    root = root,
    controller = view_dir,
    controller_file = root .. "/app/controllers/" .. view_dir .. "_controller.rb",
    action = action:gsub("^_", ""),
  }
end

local function relative_to_root(path, root)
  local prefix = root .. "/"
  if path:sub(1, #prefix) == prefix then
    return path:sub(#prefix + 1)
  end

  return path
end

local function open_file(path)
  vim.cmd.edit(vim.fn.fnameescape(path))
end

local function jump_to_action(action)
  if not action or not action:match("^[%a_][%w_]*$") then
    return false
  end

  local found = vim.fn.search("^\\s*def\\s+" .. action .. "\\>", "W")
  return found > 0
end

function M.open_view()
  local path = vim.api.nvim_buf_get_name(0)
  local context = controller_context(path)
  if not context then
    vim.notify("Not in a Rails controller", vim.log.levels.WARN)
    return
  end

  local action = current_action_name()
  if not action or not action:match("^[%a_][%w_]*$") then
    vim.notify("Put the cursor on a controller action name", vim.log.levels.WARN)
    return
  end

  if vim.fn.isdirectory(context.view_dir) == 0 then
    vim.notify("No view directory for controller: " .. context.controller, vim.log.levels.WARN)
    return
  end

  local matches = vim.fn.globpath(context.view_dir, action .. ".*", false, true)
  matches = vim.tbl_filter(function(file)
    return vim.fn.filereadable(file) == 1
  end, matches)
  table.sort(matches)

  if #matches == 0 then
    vim.notify("No template found for action: " .. action, vim.log.levels.WARN)
    return
  end

  if #matches == 1 then
    open_file(matches[1])
    return
  end

  vim.ui.select(matches, {
    prompt = "Select Rails template",
    format_item = function(item)
      return relative_to_root(item, context.root)
    end,
  }, function(choice)
    if choice then
      open_file(choice)
    end
  end)
end

function M.open_controller()
  local path = vim.api.nvim_buf_get_name(0)
  local context = view_context(path)
  if not context then
    vim.notify("Not in a Rails view", vim.log.levels.WARN)
    return
  end

  if vim.fn.filereadable(context.controller_file) == 0 then
    vim.notify("No controller found for view: " .. context.controller, vim.log.levels.WARN)
    return
  end

  open_file(context.controller_file)

  if jump_to_action(context.action) then
    vim.cmd.normal({ args = { "zz" }, bang = true })
    return
  end

  vim.notify("Opened controller, but no action found for: " .. context.action, vim.log.levels.INFO)
end

return M
