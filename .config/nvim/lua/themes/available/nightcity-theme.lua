return {
	"cryptomilk/nightcity.nvim",
	event = "UIEnter",
	version = "*",
	config = function()
		vim.cmd.colorscheme("nightcity")
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
	end,
}
