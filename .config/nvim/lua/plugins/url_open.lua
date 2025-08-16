return {
  "sontungexpt/url-open",
  cmd = "URLOpenUnderCursor",
  opts = {
    open_app = "default",
    open_only_when_curson_on_url = false,
    highlight_url = {
      all_urls = {
        enabled = false,
        fg = "text", -- "text" or "#rrggbb"
        -- fg = "text", -- text will set underline same color with text
        bg = nil,    -- nil or "#rrggbb"
        underline = true,
      },
      cursor_move = {
        enabled = true,
        fg = "text", -- "text" or "#rrggbb"
        -- fg = "text", -- text will set underline same color with text
        bg = nil,    -- nil or "#rrggbb"
        underline = true,
      },
    },
    deep_pattern = false,
  },
  keys = {
    { "gx", "<esc>:URLOpenUnderCursor<cr>", mode = "n", desc = "Open URL under the cursor" },
  },
}
