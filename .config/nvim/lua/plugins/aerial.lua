return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("aerial").setup({
      layout = {
        default_direction = "prefer_right",
      },
      backends = { "lsp", "treesitter", "markdown" },
      highlight_on_hover = true,
      show_guides = true
    })

  end,
  keys = {
    { "<leader>m", "<cmd>AerialToggle! right<CR>", desc = "Toggle method list" },
  },
}

