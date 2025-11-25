-- send nvim command output to a new buffer.
-- useful to avoid nvim's "more" pager.
vim.api.nvim_create_user_command("ToBuffer", function(opts)
  local out = vim.api.nvim_exec2(opts.args, { output = true }).output
  vim.cmd("new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(out, "\n"))
  vim.api.nvim_buf_set_name(0, "Output: " .. opts.args)
end, { nargs = "+", complete = "command" })
