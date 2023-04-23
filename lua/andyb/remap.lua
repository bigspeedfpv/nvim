
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", ";", ":")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- terminal stuff
vim.keymap.set("n", "<leader>t", "<cmd>term<CR>") -- open terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- exit terminal

vim.keymap.set("n", "<leader>,", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>vertical resize +5<CR>")

vim.keymap.set("n", "<leader>T", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set("n", "<A-,>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>")
vim.keymap.set("n", "<A-s-c>", "<cmd>BufferRestore<CR>")
vim.keymap.set("n", "<A-p>", "<cmd>BufferPin<CR>")
vim.keymap.set("n", "<A-1>", "<cmd>BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", "<cmd>BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", "<cmd>BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", "<cmd>BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", "<cmd>BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", "<cmd>BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", "<cmd>BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", "<cmd>BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", "<cmd>BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", "<cmd>BufferLast<CR>")
