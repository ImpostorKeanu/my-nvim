return {
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  { "theHamsta/nvim-dap-virtual-text", opts = {} },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    keys = {
      { "<leader>dgt", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Debug Go test" },
    },
  },
}
