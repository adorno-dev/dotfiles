function Keymaps()
	local options, keymaps = { noremap = true, silent = true }, vim.api.nvim_set_keymap
	-- <leader>
	vim.g.mapleader = ","
    vim.g.maplocalleaader = " "
	-- <shortcuts>
	keymaps("n", "<C-q>", ":quitall!<CR>", options)
	keymaps("n", "<C-s>", ":write<CR>", options)
	keymaps("n", "q", ":quit<CR>", options)
	-- <buffers>
	keymaps("n", "<C-x>", ":bprevious |bdelete #<CR>", options)
	keymaps("n", "<M-h>", ":bprevious<CR>", options)
	keymaps("n", "<M-l>", ":bnext<CR>", options)
	-- <windows>
	keymaps("n", "<C-h>", "<C-w>h", options)
	keymaps("n", "<C-l>", "<C-w>l", options)
	keymaps("n", "<C-j>", "<C-w>j", options)
	keymaps("n", "<C-k>", "<C-w>k", options)
    -- <nvim-tree>
    keymaps("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", options)
    -- <telescope>
    keymaps("n", "<leader>ff", "<cmd>Telescope find_files<CR>", options)
    keymaps("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", options)
end

Keymaps()
