-- Restore the legacy :LspInfo command
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})

-- kind_icons
local diagnostic_icons = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
}

-- 👇 define os signs corretamente
for type, icon in pairs(diagnostic_icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configuração do LSP
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "",
      [vim.diagnostic.severity.INFO]  = "",
    },
  },
  virtual_text = { prefix = "●" },
  underline = true,
  severity_sort = true,
  float = { border = "rounded" },
})

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- servers = {
        --     html = {
        --         filetypes = { "html", "razor", "cshtml" }, -- "templ"
        --     },
        --     rust_analyzer = {
        --         on_attach = function(_, bufnr)
        --             -- Hover expandido rust-tools
        --             local rt = require("rust-tools")
        --             vim.keymap.set("n", "<leader>gi", rt.hover_actions.hover_actions, { buffer = bufnr, silent = true })
        --
        --             -- se quiser, pode manter o hover padrão também
        --             vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { buffer = bufnr, silent = true })
        --         end,
        --     },
        -- }
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", event = "InsertEnter" },
        -- TODO: load one of these two options to improve performance
        -- { "decodetalkers/csharpls-extended-lsp.nvim", event = "InsertEnter" },
        -- { "hoffs/omnisharp-extended-lsp.nvim",        event = "InsertEnter" },
    },
    keys = {
        { "<leader>K",  ":lua vim.lsp.buf.hover()<CR>",                                      silent = true, desc = "Hover" },
        { "<leader>gD", ":lua vim.lsp.buf.declaration()<CR>",                                silent = true, desc = "Go to declaration" },
        { "<leader>gd", ":lua vim.lsp.buf.definition()<CR>",                                 silent = true, desc = "Go to definition" },
        { "<leader>gr", ":lua vim.lsp.buf.references()<CR>",                                 silent = true, desc = "Go to references" },
        { "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>",                                silent = true, desc = "Code action" },
        { "<leader>rn", ":lua vim.lsp.buf.rename()<CR>",                                     silent = true, desc = "Rename" },
        { "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>",                             silent = true, desc = "Go to implementation" },
        { "<leader>gs", ":lua vim.lsp.buf.signature_help()<CR>",                             silent = true, desc = "Signature help" },
        { "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>",                       silent = true, desc = "Add workspace folder" },
        { "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>",                    silent = true, desc = "Remove workspace folder" },
        { "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", silent = true, desc = "List workspace folders" },

        { "<leader>ge", ":lua vim.diagnostic.setqflist()<CR>",                               silent = true, desc = "Project diagnostics" },
        { "<leader>gE", ":lua vim.diagnostic.setloclist()<CR>",                              silent = true, desc = "Buffer diagnostics" },
        { "<leader>e",  ":lua vim.diagnostic.open_float()<CR>",                              silent = true, desc = "Line diagnostics" },

        { "<leader>ya", ":%y+<CR>",                                                          desc = "Copy entire file" },
        { "<leader>yl", '"+yy',                                                              desc = "Copy current line" },
        { "<leader>yp", '"+p',                                                               desc = "Paste from clipboard" },
    },
    -- manual lsp configuration
    config = function()
        vim.lsp.config("clangd", {
            filetypes = {
                "c",
                "cpp",
                "objc",
                "objcpp",
                "cuda",
            },
        })
        vim.lsp.config("qmlls", {
            cmd = {
                "/usr/lib/qt6/bin/qmlls",
                "-E",
                "-I",
                "/usr/lib/qt6/qml"
            },
            filetypes = {
                "qml",
            },
        })
        require("neodev").setup({
            library = {
                plugins = {
                    "nvim-dap-ui",
                    "nvim-treesitter",
                },
            },
        })
    end
}
