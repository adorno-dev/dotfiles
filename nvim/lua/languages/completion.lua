function Completion()

    local exists, completion, snippet, kind_icons

    exists, completion = pcall(require, "cmp")
    if not exists then
        return
    end

    -- # Snippy #
    --    exists, snippet = pcall(require, "snippy")
    --    if not exists then return end
    --
    --    snippet.setup({
    --        mappings = {
    --            is = {
    --                ['<Tab>'] = 'expand_or_advance',
    --                ['<S-Tab>'] = 'previous',
    --            },
    --            nx = {
    --                ['<leader>x'] = 'cut_text',
    --            },
    --        }
    --    })
    -- # Snippy #

    -- # Luasnip #
    exists, snippet = pcall(require, "luasnip")
    if not exists then
        return
    else
        require("luasnip.loaders.from_vscode").lazy_load()
        vim.cmd [[
            " press <Tab> to expand or jump in a snippet. These can also be mapped separately
            " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
            imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
            " -1 for jumping backwards.
            inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

            snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
            snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

            " For changing choices in choiceNodes (not strictly necessary for a basic setup).
            imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
            smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
        ]]
        -- # Luasnip #
    end

    --   פּ ﯟ   some other good icons
    kind_icons = {
        Text = "",
        Method = "m",
        Function = " ",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = " ",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    completion.setup({
        snippet = {
            expand = function(args)
                --snippet.expand_snippet(args.body)
                snippet.lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = completion.mapping.select_prev_item(),
            ['<C-n>'] = completion.mapping.select_next_item(),
            ['<C-d>'] = completion.mapping.scroll_docs(-4),
            ['<C-f>'] = completion.mapping.scroll_docs(4),
            ['<C-Space>'] = completion.mapping.complete(),
            ['<C-e>'] = completion.mapping.close(),
            ['<CR>'] = completion.mapping.confirm {
                behavior = completion.ConfirmBehavior.Replace,
                select = true,
            },
            ['<Tab>'] = function(fallback)
                if completion.visible() then
                    completion.select_next_item()
                    -- snippy
                    --                elseif snippet.expandable_or_advance then
                    --                    snippet.expand()
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if completion.visible() then
                    completion.select_prev_item()
                    -- snippy
                    --                elseif snippet.previous then
                    --                    snippet.previous()
                else
                    fallback()
                end
            end
        },
        confirm_opts = {
            behavior = completion.ConfirmBehavior.Replace,
            select = false
        },
        sources = {
            { name = "nvim_lsp" },
            --{ name = "snippy" },
            { name = "luasnip" }
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]"
                })[entry.source.name]
                return vim_item
            end
        },
        window = { documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
        }},
        experimental = {
            ghost_text = true,
            native_menu = false
        }
    })
end

Completion()
