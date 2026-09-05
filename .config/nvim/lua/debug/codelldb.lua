local mason_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

return {
	adapters = {
		codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = mason_path,
				args = { "--port", "${port}" },
			},
		},
	},
	configurations = {
		rust = {
			{
				name = "Debug Executable",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		},
	},
}
