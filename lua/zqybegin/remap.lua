-- define <leader> key as space
vim.g.mapleader = " "

-- Modes
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
-- smart copy: select the text that needs to be replaced
vim.keymap.set("v", "p", '"_dP')
-- smart copy: align with mouse copying in tmux
vim.keymap.set("v", "<C-c>", 'y')
-- smart copy: dirctly copy in insert_mode
vim.keymap.set("i", "<M-p>", '<C-r>+')
-- delete and not yank
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- convenient to move to the begin/end of line
vim.keymap.set("", "H" ,"^")
vim.keymap.set("", "L" ,"$")

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

-- tmux use
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- add exe to this file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- move code block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cancel "q:" key to enter command_mode
vim.keymap.set("n", "q:", "<nop>")
