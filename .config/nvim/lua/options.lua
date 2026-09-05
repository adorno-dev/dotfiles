-- core options
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.fillchars = { eob = " " }
-- vim.opt.guicursor = ""
vim.opt.guicursor = "a:ver25"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.cmd("wincmd J")
		vim.cmd("resize 20")
	end,
})
