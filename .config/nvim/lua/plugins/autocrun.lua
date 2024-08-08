return {
  "eoBattisti/autocrun.nvim",
  enabled = false,
  opts = {
    pattern = "*.c",
    cmd = "gcc",
    args = { "abc", "-o", "def" },
    output_filename = "main2"
  },
  dependencies = {
    "rcarriga/nvim-notify", }
}
