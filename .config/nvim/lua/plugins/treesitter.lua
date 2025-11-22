return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
	require('nvim-treesitter.configs').setup({
	  ensure_installed = { "vim", "lua", "go" },
	  highlight = {
	    enable = true,
	    additional_vim_regex_highlighting = false,
	  },
	  indent = {
	    enable = false,
	  },
	})
    end,
  },
}
