function Options()
	local set = vim.opt

	set.fileencoding = "utf-8"
	set.guicursor = ""
	set.termguicolors = true
	set.cursorline = true
	set.number = true

	set.expandtab = true
	set.smarttab = true
	set.shiftwidth = 4
	set.tabstop = 4

	set.smartcase = true
	set.ignorecase = true
	set.hlsearch = true
	set.incsearch = true
end

Options()
