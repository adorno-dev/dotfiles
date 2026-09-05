return {
	"samueljoli/cyberpunk.nvim",
	event = "UIEnter",
	config = function()
		-- seus ajustes anteriores
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "NONE" })

		-- reforço opcional (garante que o fundo seja aplicado em tudo)
		vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#212121" })

		-- força o fundo do neo-tree para ser o mesmo do editor
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#181818", fg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181818", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeStatusLineNC", { bg = "#181818" })

		-- se você usa o neo-tree com float (popup)
		vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#89b4fa", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#cdd6f4", bg = "#181818" })

		-- pastas, arquivos, git signs, etc. (mantém as cores, só ajusta fundo)
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#89b4fa", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#cdd6f4", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#a6e3a1", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#f9e2af", bg = "#181818" })
		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#a6e3a1", bg = "#181818" })

		require("cyberpunk").setup({
			theme = "dark",
		})
	end,
}
