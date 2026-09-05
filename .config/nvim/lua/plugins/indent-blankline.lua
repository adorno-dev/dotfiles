-- return {
--     "lukas-reineke/indent-blankline.nvim",
--     event = { "BufReadPost", "BufNewFile" },
--     main = "ibl",
--     opts = {},
--     config = function()
--         local highlight = {
--             "CursorColumn",
--             "Whitespace",
--         }
--         require("ibl").setup {
--             indent = { highlight = highlight, char = "│" },
--             whitespace = {
--                 highlight = highlight,
--                 remove_blankline_trail = false,
--             },
--             scope = { enabled = false },
--         }
--     end
-- }

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",

    config = function()
        vim.api.nvim_set_hl(0, "IblRed", {
            fg = "#E06C75",
        })

        vim.api.nvim_set_hl(0, "IblYellow", {
            fg = "#E5C07B",
        })

        vim.api.nvim_set_hl(0, "IblGreen", {
            fg = "#98C379",
        })

        vim.api.nvim_set_hl(0, "IblCyan", {
            fg = "#56B6C2",
        })

        vim.api.nvim_set_hl(0, "IblBlue", {
            fg = "#61AFEF",
        })

        vim.api.nvim_set_hl(0, "IblPurple", {
            fg = "#C678DD",
        })

        require("ibl").setup({
            indent = {
                char = "│",
                highlight = {
                    "IblRed",
                    "IblYellow",
                    "IblGreen",
                    "IblCyan",
                    "IblBlue",
                    "IblPurple",
                },
            },

            scope = {
                enabled = false,
            },
        })
    end,
}

