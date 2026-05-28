-- In your lazy.nvim plugins table (e.g., lua/plugins/dap.lua)
return {
  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Python adapter
      "mfussenegger/nvim-dap-python",
      -- UI for DAP
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
      },
      -- Virtual text for variable values
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					justMyCode = false,
				},
				{
					type = "python",
					request = "launch",
					name = "Launch file (with args)",
					program = "${file}",
					justMyCode = false,
					args = function()
						local args = vim.fn.input("Arguments: ")
						return vim.split(args, " ", { trimempty = true })
					end,
				},
			}
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      -- ── Python adapter ────────────────────────────────────────────────
      -- Points to the debugpy installed in your system/venv Python.
      -- Option 1: use the Python that has debugpy installed globally
      dap_python.setup("/home/battisti/.virtualenvs/debugpy/bin/python")

      -- Option 2: use a dedicated venv (recommended)
      -- dap_python.setup("~/.venvs/debugpy/bin/python")
      -- To create it:
      --   python3 -m venv ~/.venvs/debugpy
      --   ~/.venvs/debugpy/bin/pip install debugpy

      -- ── DAP UI ────────────────────────────────────────────────────────
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.40 },
              { id = "breakpoints", size = 0.20 },
              { id = "stacks",      size = 0.20 },
              { id = "watches",     size = 0.20 },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 12,
          },
        },
      })

      -- Auto-open/close UI when a debug session starts/ends
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- ── Virtual text ───────────────────────────────────────────────────
      require("nvim-dap-virtual-text").setup({
        commented = true, -- show virtual text as comment
      })

      -- ── Keymaps ────────────────────────────────────────────────────────
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true })
      end

      -- Session control
      map("<F5>",       dap.continue,          "DAP: Continue")
      map("<F10>",      dap.step_over,         "DAP: Step Over")
      map("<F11>",      dap.step_into,         "DAP: Step Into")
      map("<F12>",      dap.step_out,          "DAP: Step Out")
      map("<leader>dq", dap.terminate,         "DAP: Terminate")
      map("<leader>dr", dap.restart,           "DAP: Restart")

      -- Breakpoints
      map("<leader>db", dap.toggle_breakpoint, "DAP: Toggle Breakpoint")
      map("<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, "DAP: Conditional Breakpoint")
      map("<leader>dl", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
      end, "DAP: Log Point")
      map("<leader>dc", dap.clear_breakpoints,  "DAP: Clear All Breakpoints")

      -- UI
      map("<leader>du", dapui.toggle,           "DAP: Toggle UI")
      map("<leader>de", dapui.eval,             "DAP: Eval Expression")

      -- Python-specific
      map("<leader>dm", dap_python.test_method, "DAP: Test Method")
      map("<leader>dC", dap_python.test_class,  "DAP: Test Class")

      -- REPL
      map("<leader>dR", dap.repl.open,          "DAP: Open REPL")
    end,
  },
}
