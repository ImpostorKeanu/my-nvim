return {
  {
    "nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "yaml",
        "bash",
        -- golang
        "go",
        "gotmpl",
        "gomod",
        -- python
        "python",
        -- webdev
        "html",
        "css",
        "javascript",
      },
    },
  },
}
