-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- enhance filetype detection. nvim will:
-- - check extensions and set the 'filetype' option
-- - if the extension is unknown, it runs $VIMRUNTIME/scripts.vim to
--   check the contents and attempt detection
-- REMINDER: nvim-treesitter is responsible for generating syntax parsers,
--   so adding them involves updating the nvim-treesitter configurations.
vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    -- had to add a treesitter injection to enable html highlighting
    -- within go template files
    -- see: queries/gohtml/injections.scm
    gohtml = "gotmpl",
  },
})
