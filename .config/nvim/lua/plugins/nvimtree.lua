return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Tree", noremap = true, silent = true },
        },
        opts = {
            view = {
                signcolumn = "yes",
                preserve_window_proportions = true,
            },
            live_filter = {
                always_show_folders = false,
            },
            -- hijack_cursor = false,
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Open file but keep focus on the tree
                local function open_stay()
                    local node = api.tree.get_node_under_cursor()
                    if node and not node.nodes then
                        -- it's a file
                        api.node.open.edit()
                        vim.cmd("wincmd p") -- go back to the tree window
                    end
                end

                -- Collapse the current folder node
                local function collapse_node()
                    local node = api.tree.get_node_under_cursor()
                    if node and node.open and node.nodes then
                        api.node.navigate.parent_close()
                    end
                end

                local function vsplit_preview()
                    local node = api.tree.get_node_under_cursor()
                    if node.nodes == nil then
                        api.node.open.vertical()
                        -- Optionally: keep the tree open
                    end
                end

                api.config.mappings.default_on_attach(bufnr)

                -- 🔑 Your custom mappings
                vim.keymap.set("n", "l", api.node.open.edit, opts("Edit Or Open"))
                vim.keymap.set("n", "L", open_stay, opts("Open Stay In Tree"))
                vim.keymap.set("n", "h", collapse_node, opts("Collapse"))
                vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
                vim.keymap.set("n", "v", vsplit_preview, opts("VSplit Preview"))
            end,
        },
    },
}
