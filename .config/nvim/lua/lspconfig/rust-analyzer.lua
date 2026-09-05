local M = {}

function M.setup()
	local lspconfig = require("lspconfig")

	-- 🔥 Capabilities (compatível com ou sem nvim-cmp)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	pcall(function()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	end)

	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		ft = "rust",

		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					buildScripts = { enable = true },
				},

				workspace = {
					symbol = {
						search = {
							kind = "all",
						},
					},
				},

				checkOnSave = {
					command = "clippy",
					extraArgs = { "--", "-W", "clippy::all" },
				},

				procMacro = {
					enable = true,
                    -- other settings 
                    ignored = {
                        leptos_macro = {
                            -- optional: --
                            -- "component",
                            "server",
                        }
                    }
				},

				inlayHints = {
					bindingModeHints = { enable = false },
					chainingHints = { enable = true },
					closingBraceHints = { enable = true },
					parameterHints = { enable = true },
					typeHints = { enable = true },
				},

			},
		},

		on_attach = function(client, bufnr)
			-- 🔥 Inlay hints automático
			if vim.lsp.inlay_hint then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end

			-- 🔥 Format + organize imports on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { "source.organizeImports" } },
						apply = true,
					})
					vim.lsp.buf.format({ async = false })
				end,
			})

			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, {
					buffer = bufnr,
					silent = true,
					desc = desc,
				})
			end

			-- -- 🔥 Signature Help (modo insert)
			-- vim.keymap.set("i", "<C-k>", function()
			-- 	vim.lsp.buf.signature_help()
			-- end, { buffer = bufnr, silent = true, desc = "Signature Help" })

			-- 🔥 Toggle Inlay Hints
			map("<leader>th", function()
				local enabled = vim.lsp.inlay_hint.is_enabled()
				vim.lsp.inlay_hint.enable(not enabled)
			end, "Toggle Inlay Hints")

			-- 🔥 Expand Macro
			map("<leader>em", function()
				vim.lsp.buf_request(
					0,
					"rust-analyzer/expandMacro",
					vim.lsp.util.make_position_params(),
					function(_, result)
						if result and result.expansion then
							vim.cmd("new")
							vim.api.nvim_buf_set_lines(
								0,
								0,
								-1,
								false,
								vim.split(result.expansion, "\n")
							)
						end
					end
				)
			end, "Expand Macro")

			-- 🔥 Cargo Run
			map("<leader>rr", function()
				vim.cmd("split | terminal cargo run")
			end, "Cargo Run")

			-- 🔥 Cargo Test
			map("<leader>rt", function()
				vim.cmd("split | terminal cargo test")
			end, "Cargo Test")

			-- 🔥 Workspace symbols
			map("<leader>ws", function()
				vim.lsp.buf.workspace_symbol()
			end, "Workspace Symbol Search")

			-- 🔥 Abrir documentação local std
			map("<leader>rd", function()
				vim.cmd("!rustup doc --std")
			end, "Rust Std Docs")
		end,
	})

	-- 🔥 Hover melhorado
	vim.lsp.handlers["textDocument/hover"] =
		vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
			max_width = 100,
			max_height = 30,
		})

	-- 🔥 Signature Help com borda
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
			max_width = 80,
			max_height = 20,
		})

	vim.diagnostic.config({
		virtual_text = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
		},
	})
end

return M

