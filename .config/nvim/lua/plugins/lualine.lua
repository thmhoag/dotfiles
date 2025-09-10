return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
	local custom_iceberg = require'lualine.themes.iceberg'

	require('lualine').setup {
	  options = {
	    theme  = custom_iceberg,
	    globalstatus = true,
	  },
	}
    end,
  },
}
