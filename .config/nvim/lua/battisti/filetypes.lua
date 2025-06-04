vim.filetype.add({
  extension = {
    env = "sh",
    dockerfile = "dockerfile"
  },
  filename = {
    [".env"] = "bash",
    ["dockerfile"] = "dockerfile"
  },
  pattern = {
    [".env.*"] = "bash",
    ["dockerfile.*"] = "dockerfile"
  }
})

