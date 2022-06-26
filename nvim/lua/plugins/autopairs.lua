function Autopairs()
    local exists, autopairs, autopairs_completion, completion
    exists, autopairs = pcall(require, "nvim-autopairs")
    if not exists then
        return
    else
        autopairs.setup {
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        }
    end
    exists, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")
    if not exists then
        return
    else
        exists, completion = pcall(require, "cmp")
        if exists then
            completion.event:on("confirm_done", autopairs_completion.on_confirm_done { map_char = { text = "" } })
        end
    end
end

Autopairs()
