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

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    gohtml = "html_gotmpl",
    gtemp = get_gotmpl_parser,
  },
})
