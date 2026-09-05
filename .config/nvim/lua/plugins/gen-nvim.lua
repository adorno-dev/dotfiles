return {
    "David-Kunz/gen.nvim",
    config = function()
        require("gen").setup({
            model = "qwen2.5-coder:7b-instruct-q4_K_M",
            host = "localhost",
            port = "11434",
            display_mode = "float",
            -- Manter janela aberta após enviar (para chat contínuo)
            stay_on_submit = true,
            -- Manter histórico da conversa
            history = true,
            winopts = {
                -- Tamanho: 60% da largura e 60% da altura
                width = 0.6,
                height = 0.6,
                -- Centralizado: 0.5 = meio da tela
                row = 0.5,
                col = 0.5,
                -- Borda bonita
                border = "rounded",
                -- Título da janela (opcional)
                title = " Qwen2.5 Coder ",
                title_pos = "center",
            },
        })
    end,
    keys = {
        {
            "<leader>gg",
            ":Gen<CR>",
            desc = "Abrir Chat (igual ao ChatGPT)",
            mode = { "n", "v" },
        },
        -- Opcional: atalho para perguntas rápidas sem seleção
        {
            "<leader>gq",
            ":Gen ",
            desc = "Pergunta rápida",
            mode = { "n", "v" },
        },
    },
}
