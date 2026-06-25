-- disable left/right completion because of sqlcomplete#DrillIntoTable errors
-- 2026-06-25
pcall(vim.keymap.del, "i", "<Left>", { buffer = true })
pcall(vim.keymap.del, "i", "<Right>", { buffer = true })
