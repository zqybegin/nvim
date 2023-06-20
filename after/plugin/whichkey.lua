-- if plugin isn't loaded, only return and don't report error
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    return
end

which_key.setup{
    plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    ignore_missing = true,
    layout = {
        height = { min = 1, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
}

local leader_mapping = {
    ["u"]  = {"<cmd>UndotreeToggle<CR>", "UndoTree"},
    ["s"]  = {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace"},
    ["w"] = { "<cmd>w<CR><cmd>so<CR>","Wirte and Source this file" },
    ["v"] = { "<cmd>vsplit<CR><cmd>wincmd l<CR><cmd>Telescope find_files<CR>","spilt vertically and fuzzy find"},
    ["i"] = { "<cmd>IconPickerNormal<cr>","insert text icon"},
    ["q"] = { "<cmd>xa<CR>","exit nvim"},
    p = {
        name = "Fuzzy find",
        f = { "<cmd>Telescope find_files<cr>", "Search Files" },
        s = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })end, "Search Symbol" },
        h = { "<cmd>Telescope help_tags<cr>", "Search Vim Manual" },
    },
    f = {
        name = "file tree",
        o = { "<cmd>NvimTreeFindFile<cr>", "open file in dir" },
        t = { "<cmd>NvimTreeToggle<cr>", "toggle file tree" }
    },

    -- Git:https://github.com/lewis6991/gitsigns.nvim#keymaps
    g = {
        name = "Git",
        j = {'<cmd>Gitsigns next_hunk<CR>', "next change"},
        k = {'<cmd>Gitsigns prev_hunk<CR>', "prev change"},
        o = {'<cmd>Gitsigns preview_hunk<CR>', "open change"},
        r = {'<cmd>Gitsigns reset_hunk<CR>', "reset change"},
    },

    -- LSP
    ["j"] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "next diagnostic"},
    ["k"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "prev diagnostic"},
    ["o"] = { '<cmd>lua vim.diagnostic.open_float()<CR>', "open diagnostic"},
    -- ["s"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "save to location list"},
}

local leader_opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mapping = {
    g = {
        name = "goto funciton",
        d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "goto function definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "goto function declaration"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "goto function implementation"},
        r = {"<cmd>lua vim.lsp.buf.references()<cr>", "goto function references"},
    },
    K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "show diagnostic hover"},
    --vim.cmd [[ command! format execute 'lua vim.lsp.buf.formatting()' ]]
}

local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}


which_key.register(leader_mapping, leader_opts)
which_key.register(mapping, opts)
