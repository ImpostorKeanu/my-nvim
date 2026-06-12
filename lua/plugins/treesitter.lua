return {
  {
    "nvim-treesitter",
    opts = {
      ensure_installed = {
        "cue",
        "lua",
        "yaml",
        "bash",
        -- golang
        "go",
        "gotmpl",
        "gomod",
        -- go template (gotmpl) file formats
        "html_gotmpl",
        "yaml_gotmpl",
        "json_gotmpl",
        "python",
        -- webdev
        "html",
        "css",
        "javascript",
      },
    },
  },
}
