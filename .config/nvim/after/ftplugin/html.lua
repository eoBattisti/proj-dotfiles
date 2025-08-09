local setlocal = vim.opt_local

---@param cwd string
local function validate_django_project(cwd)
  local result = vim.fn.globpath(cwd, "**/manage.py", false, true)

  return #result > 0
end

local cwd = vim.fn.getcwd()

if validate_django_project(cwd) then
  setlocal.filetype = "htmldjango"

  require("lspconfig").pyright.setup({
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          stubPath = "~/.config/nvim/.venv/lib/python3.11/site-packages/django-stubs/"

        }
      }
    }
  })
end

