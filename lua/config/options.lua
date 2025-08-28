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

-- ENABLE PER-PROJECT RC/SCRIPTS
vim.opt.exrc = true -- allow per-project rc files (.nvim.lua)
vim.opt.secure = true -- require that per-project rc files are trusted (see :h trust)

-- CLIPBOARD BEHAVIOR
-- vim.opt.clipboard = "unnamedplus" -- enable clipboard nonsense
vim.opt.clipboard = "" -- disable clipboard nonsense

vim.opt.completeopt = "menu,menuone,noselect,preview"
