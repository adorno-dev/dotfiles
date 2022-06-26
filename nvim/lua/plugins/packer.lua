function Packer()

		local bootstrap, func, cmd = nil, vim.fn, vim.cmd
		local install_path = func.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

		if func.empty(func.glob(install_path)) > 0 then
				bootstrap = func.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
				print "Installing packer close and reopen neovim..."
				cmd [[packadd packer.nvim]]
		end

		-- autocommand that reloads neovim whenever you save the <packer.lua> file
		cmd [[
			augroup packer_user_config
			autocmd!
			autocmd BufWritePost packer.lua source <afile> | PackerSync
			augroup end
		]]

		-- avoids error message when there's no <packer.nvim> available
		local exists, packer = pcall(require, "packer")
		if not exists then
			return
		end

		-- have packer use a popup window
		packer.init {
			display = {
				open_fn = function()
					return require("packer.util").float { border = "rounded" }
				end
			}
		}

		-- plugins installation
		return packer.startup(function(use)
			-- packer manager itself
			use "wbthomason/packer.nvim"
            -- useful lua functions used ny lots of plugins
            use "nvim-lua/plenary.nvim"
			-- language server protocol
			use { "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" }
            -- snippets
            use {
                "dcampos/nvim-snippy",
                "l3mon4d3/luasnip",
                "rafamadriz/friendly-snippets"
            }
            -- signatures
            --use "ray-x/lsp_signature.nvim"
            -- completions
            -- razor pages/views
            use "adamclerk/vim-razor"
            use { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "dcampos/cmp-snippy", "saadparwaiz1/cmp_luasnip" }
            -- plugins
                use "windwp/nvim-autopairs"
                use "numtostr/comment.nvim"
            -- color schemes
                use "norcalli/nvim-colorizer.lua"
                use "lunarvim/colorschemes"
                use "matsuuu/pinkmare"
                use "morhetz/gruvbox"
            -- icon packs
                use "kyazdani42/nvim-web-devicons"
            -- bufferline
                use "akinsho/bufferline.nvim"
                use "moll/vim-bbye"
            -- nvim-tree
                use "kyazdani42/nvim-tree.lua"
            -- statusbar
                use "nvim-lualine/lualine.nvim"
            -- telescope
                use "nvim-telescope/telescope.nvim"
                use "nvim-telescope/telescope-media-files.nvim"
            --  user "MaxMEllon/vim-jsx-pretty"

			if bootstrap then
				require("packer").sync()
			end
		end)

end

Packer()
