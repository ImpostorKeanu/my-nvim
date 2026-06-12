-- this sets file extensions for various go templating
-- dialects (file types).

-- languages that are injected into gtemp
-- files based on extension.
local langs = {
  yml = "yaml",
  yaml = "yaml",
  json = "json",
  html = "html",
  bash = "bash",
  sh = "bash",
  env = "bash",
  cue = "cue",
}

local aliases = {
  gohtml = "html_gotmpl",
  gotmpl = "gotmpl",
}

-- get the parser for gotmp file types.
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
  local fileName = vim.fn.fnamemodify(path, ":t")

  local lead = fileName:match("^(.+)%.")
  local envLeads = { env = true, environ = true, environment = true }
  if lead and envLeads[lead] then
    return "bash_gotmpl"
  end

  local ext = fileName:match("^.+%.(.+)$")
  ext = ext and aliases[ext]
  if ext then
    vim.b[bufnr].gtemp_injection_language = ext
    -- e.g. html_gotmpl
    return ext
  end

  -- capture group gets dialect
  local dialect = fileName:match("^.+%.(.+)%.")
  local lang = dialect and langs[dialect]

  -- default return value
  ext = "gotmpl"
  if lang then
    vim.b[bufnr].gtemp_injection_language = lang
    -- e.g. yaml_gotmpl
    ext = langs[lang] .. "_" .. "gotmpl"
  end

  return ext
end

vim.filetype.add({
  extension = {
    gotmpl = get_gotmpl_parser,
    gohtml = get_gotmpl_parser,
    gtemp = get_gotmpl_parser,
  },
})
