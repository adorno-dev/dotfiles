function NvimTree()

    local exists, nvim_tree, nvim_tree_config, tree_cb

    exists, nvim_tree = pcall (require, "nvim-tree")

    if not exists then return end

    exists, nvim_tree_config = pcall (require, "nvim-tree.config")

    if not exists then return end

    tree_cb = nvim_tree_config.nvim_tree_callback

    nvim_tree.setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {
            "startify",
            "dashboard",
            "alpha",
        },
        -- auto_close = true,
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = true,
--        update_to_buf_dir = {
--            enable = true,
--            auto_open = true,
--        },
        diagnostics = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {
                "obj/"
            },
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        view = {
            width = 40,
            height = 30,
            hide_root_folder = false,
            side = "left",
--            auto_resize = true,
            mappings = {
                custom_only = false,
                list = {
                    { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                    { key = "h", cb = tree_cb "close_node" },
                    { key = "v", cb = tree_cb "vsplit" },
                },
            },
            number = false,
            relativenumber = false,
        },
        --quit_on_open = 0,
        --git_hl = 1,
        --disable_window_picker = 0,
        --root_folder_modifier = ":t",
--        show_icons = {
--            git = 1,
--            folders = 1,
--            files = 1,
--            folder_arrows = 1,
--            tree_width = 30,
--        }
    })
end

NvimTree()
