local gtemp_filetypes = {
  "yaml_gotmpl",
  "json_gotmpl",
  "toml_gotmpl",
  "html_gotmpl",
}

vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = gtemp_filetypes,
  callback = function(args)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      local ft = vim.bo[args.buf].filetype
      if ft == "" then
        return
      end

      local ok, err = pcall(vim.treesitter.start, args.buf, ft)
      if not ok then
        vim.notify("tree-sitter failed for " .. ft .. ": " .. tostring(err), vim.log.levels.WARN)
      end
    end)
  end,
})

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
        end,
      })
    end,
    opts = function(_, opts)
      opts.local_parsers = opts.local_parsers or {}
      opts.ensure_installed = opts.ensure_installed
        or {
          "cue",
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
          -- gotmpl file formats
          "html_gotmpl",
          "yaml_gotmpl",
          "json_gotmpl",
        }
    end,
  },
}
