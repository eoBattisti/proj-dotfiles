local M = {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
}

function M.config()
  local status_ok, url_open = pcall(require, "url-open")
  if not status_ok then
      return
  end

  local opts = {
    open_app = "default",
    open_only_when_curson_on_url = false,
    highlight_url = {
        all_urls = {
            enabled = false,
            fg = "text", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = nil, -- nil or "#rrggbb"
            underline = true,
        },
        cursor_move = {
            enabled = true,
            fg = "text", -- "text" or "#rrggbb"
            -- fg = "text", -- text will set underline same color with text
            bg = nil, -- nil or "#rrggbb"
            underline = true,
        },
    },
    deep_pattern = false,
  }

  url_open.setup(opts)
end

return M
