return {
  { "rafamadriz/friendly-snippets", enabled = false },
  { "saghen/blink.cmp", enabled = false },
  -- disable auto-pairing
  { "echasnovski/mini.pairs", enabled = false },
  -- disable hijacking of tabs
  { "akinsho/bufferline.nvim", enabled = false },
  -- disable hijacking of ui messages, cmdline, and popupmenu
  { "folke/noice.nvim", enabled = false },
  -- subtle dashboard
  { "folke/snacks.nvim", opts = {
    dashboard = {
      preset = {
        header = "NeoVIM",
      },
    },
  } },
}
