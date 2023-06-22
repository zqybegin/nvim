-- Modes
-- define <leader> key as space
vim.g.mapleader = " "

--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- move and delete buffer
vim.keymap.set('n', '<C-h>', '<cmd>bp<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>bn<CR>')
vim.keymap.set('n', '<C-q>', '<cmd>BufDel<CR>')

-- replace the action of "p" with "P"
vim.keymap.set('', 'p', 'P', { noremap = true })
vim.keymap.set('', 'P', 'p', { noremap = true })

-- smart copy
vim.keymap.set("v", "p", '"_dP')

-- cancel q: to open command-line window 
vim.keymap.set("n", "q:" ,"<nop>")

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

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- type W to save file 
vim.keymap.set("n", "W" ,"<cmd>:w<CR>")

-- type <ENTER> to disable highlight of word
vim.keymap.set("n", "<CR>" ,"<cmd>noh<CR><CR>")

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
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- add exe to this file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- move code block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

