vim.api.nvim_create_user_command("GoDoc", function (opts)
	local doc_str
	local target = opts.args

	local function on_exit(out)
		vim.schedule( function ()
			local buf_id = vim.api.nvim_create_buf(true, true)
			vim.api.nvim_buf_set_lines(buf_id, 0, -1, true, vim.split(out.stdout, "\n"))
			vim.api.nvim_set_option_value('modifiable', false, { buf = buf_id})
			vim.api.nvim_buf_set_name(buf_id, 'godoc')
			vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf_id})
			vim.api.nvim_set_option_value('filetype', 'help', { buf = buf_id})

			vim.cmd(":vsplit")
			vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), buf_id)
		end)
	end


	vim.system({'go', 'doc', target}, { text = true }, on_exit)



end, { nargs = 1})

vim.api.nvim_create_user_command(
  "PyModuleCreate", function (opts)
    local module_name = opts.args

    if module_name == "" then
      print("Usage: :PyModuleCreate <module_name>")
      return
    end

    local cmd = string.format("mkdir -p %s && touch %s/__init__.py", module_name, module_name)
    vim.fn.system(cmd)

    if vim.v.shell_error == 0 then
      print("Module '" .. module_name .. "' created successfully.")
    else
      print("Error creating module '" .. module_name .. "'.")
    end

    vim.cmd("edit .")

  end, { nargs = 1 }
)

vim.api.nvim_create_user_command("DjangoCreateApp", function (args)
	local env = vim.fn.getenv("VIRTUAL_ENV") 

	local function getPath(str, sep)
		sep = sep or '/'
		return str:match("(.*" .. sep .. ")")
 	end

	---@param obj vim.SystemCompleted
	local function on_exit(obj)
		if obj.code ~= 0 then
			local errMsg = string.format("Error while trying to create app: %s", obj.stderr) 
			vim.print(errMsg)
		end
	end

	if env then
		local basepath = getPath(env)
		local cmd = vim.split(string.format("%s/bin/python %smanage.py startapp %s %s%s", env, basepath, args.args, basepath, args.args), " ")
		vim.system(cmd, { text = true}, on_exit)
	else
		vim.print("No virtual environment enabled.")
	end
end, { nargs = 1})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "silent! update",
  desc = "Auto save all files on buffer leave or focus lost",
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
  desc = "Check if file changed outside of Neovim on focus gained or buffer enter",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
  desc = "Notify user when file is changed outside of Neovim",
})


vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function (args)
		local buf_id = args.data.buf_id
		local mini_files = require("mini.files")

		-- Yank filename to clipboard
		vim.keymap.set('n', '<space>y', function ()
			local curr_entry = mini_files.get_fs_entry()

			if curr_entry then
				local path = curr_entry.path
				local safe_path = path:gsub([[\]], [[\\]]):gsub([["]], [[\"]])
				local filename = vim.fs.basename(safe_path)
				local result
				if jit.os == "OSX"  then
          result = vim.fn.system({
            "osascript",
            "-e",
            string.format([[tell application "Finder" to set the clipboard to (POSIX file "%s")]], filename),
          })
				elseif jit.os == "Linux" then
					local f = io.popen("xclip -selection clipboard", "w")
					if f then
						f:write(filename)
						f:close()
					end
				end

				if vim.v.shell_error ~= 0 then
					vim.notify("Copy failed: " .. result, vim.log.levels.ERROR)
				else
					vim.notify(vim.fn.fnamemodify(path, ":t"), vim.log.levels.INFO)
					vim.notify("Copied to system clipboard", vim.log.levels.INFO)
				end
			else
				vim.notify("No file selected", vim.log.levels.WARN)
			end
		end, { buffer = buf_id, noremap = true, silent = true, desc = "Copy filename to path"})

		-- Yank filepath to clipboard
		vim.keymap.set('n', '<space>Y', function ()
			local curr_entry = mini_files.get_fs_entry()

			if curr_entry then
				local path = curr_entry.path
				local safe_path = path:gsub([[\]], [[\\]]):gsub([["]], [[\"]])
				local result = nil

				if jit.os == "OSX"  then
          result = vim.fn.system({
            "osascript",
            "-e",
            string.format([[tell application "Finder" to set the clipboard to (POSIX file "%s")]], safe_path),
          })
				elseif jit.os == "Linux" then
					local f = io.popen("xclip -selection clipboard", "w")
					if f then
						f:write(safe_path)
						f:close()
					end
				end

				if vim.v.shell_error ~= 0 then
					vim.notify("Copy failed: " .. result, vim.log.levels.ERROR)
				else
					vim.notify(vim.fn.fnamemodify(path, ":t"), vim.log.levels.INFO)
					vim.notify("Copied to system clipboard", vim.log.levels.INFO)
				end
			else
				vim.notify("No file or directory selected", vim.log.levels.WARN)
			end

		end, { buffer = buf_id, noremap = true, silent = true, desc = "Copy file/dir path to clipboard"})

	end,
})
