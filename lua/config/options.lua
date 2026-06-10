-- languages that are injected into gtemp
-- files based on extension.
local gtemp_langs = {
  yml = "yaml",
  yaml = "yaml",
  json = "json",
  html = "html",
  bash = "bash",
  sh = "bash",
  env = "bash",
}

-- get the parser for gtemp/gotmp file types.
--
-- format file names like: stuff.yml.gotmpl
--
-- the injected file type is extracted from
-- the second field of the file name.
--
-- see gtemp_langs for supported values.
--
-- see plugins/treesitter.lua for information
-- on where things are stored.
function get_gotmpl_parser(path, bufnr)
  local full = vim.fn.fnamemodify(path, ":t")
  local ftype = full:match("^.+%.(.+)%.")
  local lang = ftype and gtemp_langs[ftype]

  local ft = "gotmpl"
  if lang then
    vim.b[bufnr].gtemp_injection_language = lang
    ft = gtemp_langs[lang] .. "_" .. "gotmpl"
  end

  return ft
end

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
    gohtml = "html_gotmpl",
    gtemp = get_gotmpl_parser,
    cue = "cue",
  },
})

vim.opt.mouse = "" -- disable mouse

-- ENABLE PER-PROJECT RC/SCRIPTS
vim.opt.exrc = true -- allow per-project rc files (.nvim.lua)
vim.opt.secure = true -- require that per-project rc files are trusted (see :h trust)

-- CLIPBOARD BEHAVIOR
-- vim.opt.clipboard = "unnamedplus" -- enable clipboard nonsense
vim.opt.clipboard = "" -- disable clipboard nonsense
vim.opt.completeopt = "menu,menuone,noselect,preview"
