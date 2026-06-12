-- autocommand that adds gotmpl parser dialects to treesitter
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    local parsers = require("nvim-treesitter.parsers")

    --=============================================
    -- CONFIGURE LOCATION OF CUSTOM GOTMPL DIALECTS
    --=============================================
    -- this is for highlighting of languages injected into
    -- golang templates, i.e., a golang template with yaml

    local repo = vim.fn.expand("~/.config/nvim/tree-sitter")
    parsers.html_gotmpl = {
      install_info = {
        path = repo,
        location = "dialects/html_gotmpl",
        generate = false,
        queries = "queries/html_gotmpl",
      },
    }
    parsers.yaml_gotmpl = {
      install_info = {
        path = repo,
        location = "dialects/yaml_gotmpl",
        generate = true,
        queries = "queries/yaml_gotmpl",
      },
    }
    parsers.json_gotmpl = {
      install_info = {
        path = repo,
        location = "dialects/json_gotmpl",
        generate = true,
        queries = "queries/json_gotmpl",
      },
    }
    parsers.bash_gotmpl = {
      install_info = {
        path = repo,
        location = "dialects/bash_gotmpl",
        generate = true,
        queries = "queries/bash_gotmpl",
      },
    }
    parsers.cue_gotmpl = {
      install_info = {
        path = repo,
        location = "dialects/cue_gotmpl",
        generate = true,
        queries = "queries/cue_gotmpl",
      },
    }
  end,
})
