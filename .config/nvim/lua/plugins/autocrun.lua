return {
  "eoBattisti/autocrun.nvim",
  opts = {
    pattern = "*.c",
    cmd = "gcc",
    args = {"abc", "-o", "def"}, 
    output_filename = "main2"
  },
  dependencies = {
    "rcarriga/nvim-notify",}
}
