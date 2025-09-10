return {
  "saghen/blink.cmp",
  enabled = false,
  dependencies = { 
    "fang2hou/blink-copilot",
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  event = "InsertEnter",
  opts = {
    sources = {
      default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
  config = function()
  end,
}

