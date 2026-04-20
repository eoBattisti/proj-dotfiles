return {
    cmd = { 'gh-actions-language-server', '--stdio' },
    filetypes = { 'yaml' },
    single_file_support = false,
    capabilities = {
        workspace = {
            didChangeWorkspaceFolders = {
                dynamicRegistration = true,
            },
        },
    },
    root_dir = function(bufnr, on_dir)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local dirs_to_check = {
            '.github/workflows',
            '.forgejo/workflows',
            '.gitea/workflows',
        }
        local dir = vim.fs.dirname(filename)
        for _, subdir in ipairs(dirs_to_check) do
            local match = vim.fs.find(subdir, { path = dir, upward = true })[1]
            if match and vim.fn.isdirectory(match) == 1 and vim.fs.dirname(filename) == match then
                on_dir(match)
                return
            end
        end
    end,
}
