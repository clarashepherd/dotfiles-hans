-- =========================
--  Key mappings
-- =========================

local map = vim.keymap.set

-- Always keep cursor centered when jumping
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")

-- Substitute all at cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/]])

-- Start substitute based on visual selection
map("v", "<leader>s", ":s/")

-- Append to end when using visual mode
map("v", "<leader>e", ":s/$/")

-- Substitute one occurrence at a time (cgn helper)
map(
  "n",
  "c<Tab>",
  [[:let @/=expand('<cword>')<CR>cgn]],
  { silent = true }
)

-- Tabs
map("n", "<C-Up>", ":tabnew<CR>")
map("n", "<leader><Down>", ":tabclose<CR>")
map("n", "<C-Right>", ":+tabnext<CR>")
map("n", "<C-Left>", ":-tabnext<CR>")
map("n", "<M-Left>", ":tabmove -1<CR>")
map("n", "<M-Right>", ":tabmove +1<CR>")

-- Terminal: escape to normal mode with double escape
map("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")
