return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          local parsers = require("nvim-treesitter.parsers")
          local repo = vim.fn.expand("~/.config/nvim/tree-sitter-go-template-gtemp")

          parsers.html_gotmpl = {
            -- tier = 1,
            install_info = {
              -- url = "",
              -- revision = "",
              path = repo,
              location = "dialects/html_gotmpl",
              generate = false,
              queries = "queries/html_gotmpl",
            },
          }
          parsers.yaml_gotmpl = {
            -- tier = 1,
            install_info = {
              -- url = "",
              -- revision = "",
              path = repo,
              location = "dialects/yaml_gotmpl",
              generate = true,
              queries = "queries/yaml_gotmpl",
            },
          }
          parsers.json_gotmpl = {
            -- tier = 1,
            install_info = {
              -- url = "",
              -- revision = "",
              path = repo,
              location = "dialects/json_gotmpl",
              generate = true,
              queries = "queries/json_gotmpl",
            },
          }
          parsers.bash_gotmpl = {
            -- tier = 1,
            install_info = {
              -- url = "",
              -- revision = "",
              path = repo,
              location = "dialects/bash_gotmpl",
              generate = true,
              queries = "queries/bash_gotmpl",
            },
          }
        end,
      })
    end,

    opts = function(_, opts)
      opts.local_parsers = opts.local_parsers or {}
      opts.ensure_installed = opts.ensure_installed
        or {
          -- "cue",
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
        }

      vim.list_extend(opts.ensure_installed, {
        "gotmpl",
        "html_gotmpl",
        "yaml_gotmpl",
        "json_gotmpl",
      })
    end,
  },
}
