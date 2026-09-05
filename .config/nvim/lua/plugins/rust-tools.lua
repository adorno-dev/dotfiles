return {
    "simrat39/rust-tools.nvim",
    ft = "rust",  -- só carrega em arquivos Rust
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    -- config = function()
    --     -- você pode colocar configurações básicas aqui, mas 
    --     -- o hover expandido será ligado via nvim-lspconfig on_attach
    -- end,
}
