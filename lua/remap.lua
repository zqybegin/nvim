vim.g.mapleader = " "

-- use q to quit neovim
vim.keymap.set("n", "q" ,"<cmd>q<CR>")

-- convenient to move to the begin/end of line
vim.keymap.set("n", "H" ,"^")
vim.keymap.set("n", "L" ,"$")

-- if don't use, the action of dH/dL is confused by which-key plugin.
-- the expected behavior is delete words from cursor to the end/begin of line.
-- but the actual behavior is based on otiginal H/L.
-- this problem should be solved by reading the manal of which-key. but I can't find.
-- vim.keymap.set("n", "dH" ,"d^")
-- vim.keymap.set("n", "dL" ,"d$")

-- type W to save file 
vim.keymap.set("n", "W" ,"<cmd>:w<CR>")

-- type <ENTER> to disable highlight of word
vim.keymap.set("n", "<CR>" ,"<cmd>noh<CR><CR>")

-- move code block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append the next line to this line
vim.keymap.set("n", "J", "mzJ`z")

-- hold cursor in the middle of window
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete and not yank
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- tmux use
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Qucikfix and Location list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


-- add exe to this file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


