vim.g.mapleader = " "

vim.keymap.set("n", "<leader>wh", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { silent = true })
vim.keymap.set("n", "<leader>ws", "<Cmd>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>wS", "<Cmd>split<CR>", { silent = true })
vim.keymap.set("n", "<leader>wq", "<Cmd>close<CR>", { silent = true })
vim.keymap.set("n", "<leader>wo", "<Cmd>only<CR>", { silent = true })

vim.keymap.set("n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", { silent = true })

vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", "<Cmd>Telescope oldfiles<CR>", { silent = true })

vim.keymap.set("n", "<leader>lk", "<Cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<leader>ld", "<Cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "<leader>lo", "<Cmd>Lspsaga outline<CR>", { silent = true })
vim.keymap.set("n", "<leader>lt", "<Cmd>Lspsaga term_toggle<CR>", { silent = true })

vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "<Cmd>NvimTreeFocus<CR>", { silent = true })


