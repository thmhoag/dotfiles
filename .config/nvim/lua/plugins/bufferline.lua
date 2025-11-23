return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "*",
        config = true,
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Files",
                        highlight = "Directory",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        },
    },
}
