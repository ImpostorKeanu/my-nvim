require("config.filetypes")
require("config.gotmpl")

-- vim.opt.mouse = "" -- disable mouse

-- ENABLE PER-PROJECT RC/SCRIPTS
vim.opt.exrc = true -- allow per-project rc files (.nvim.lua)
vim.opt.secure = true -- require that per-project rc files are trusted (see :h trust)

-- CLIPBOARD BEHAVIOR
-- vim.opt.clipboard = "unnamedplus" -- enable clipboard nonsense
vim.opt.clipboard = "" -- disable clipboard nonsense
vim.opt.completeopt = "menu,menuone,noselect,preview"
