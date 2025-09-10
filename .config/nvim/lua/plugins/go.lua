return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" }, -- required UI lib
    ft = { "go", "gomod", "gosum", "gotmpl" },                -- lazy-load only for Go files
    config = function()
      require("go").setup({
        lsp_cfg = true,      -- enable gopls
        lsp_keymaps = true,  -- recommended
        gofmt = "gofumpt",   -- or "gofmt"
        tag_transform = false,
        test_dir = "",
      })
    end,
    build = ':lua require("go.install").update_all()', -- install/update go tools
  }
}
