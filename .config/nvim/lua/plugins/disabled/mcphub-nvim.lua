return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest",  -- Instala o hub global
  config = function()
    require("mcphub").setup({
      port = 3000,
      auto_approve = true,  -- Aceita automaticamente (depois desativa)
      extensions = {
        -- Se quiser integrar com avante.nvim ou别的
      }
    })
  end,
  keys = {
    { "<leader>mc", ":MCPHub<CR>", desc = "Abrir MCP Hub" },
    { "<leader>ms", ":MCPHubServer<CR>", desc = "Gerenciar servidores" },
  }
}
