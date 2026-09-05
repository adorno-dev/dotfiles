return {
	"astronvim/astrotheme",
	event = "UIEnter",
	config = function()
		require("astrotheme").setup()
		vim.cmd.colorscheme("astrodark")
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
	end,
}
