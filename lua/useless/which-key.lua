local M = {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        plugins = {
            marks = false,     -- shows a list of your marks on ' and `
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true,    -- adds help for operators like d, y, ...
                motions = true,      -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true,      -- default bindings on <c-w>
                nav = true,          -- misc bindings to work with windows
                z = true,            -- bindings for folds, spelling and others prefixed with z
                g = true,            -- bindings for prefixed with g
            },
        },
        ignore_missing = true,
        layout = {
            height = { min = 1, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 5,                    -- spacing between columns
            align = "left",                 -- align columns left, center or right
        },

    }
}

function M.config()
    -- if plugin isn't loaded, only return and don't report error
    local which_key = require('which-key');

    which_key.register({
        ["u"] = { "<cmd>UndotreeToggle<CR>", "UndoTree" },
        ["a"] = { "gg0vG$", "Select All text" },
        ["s"] = { [[:%s#\<<C-r><C-w>\>#<C-r><C-w>#gcI<Left><Left><Left><Left>]], "Amazing Replace" },
        ["w"] = { "<cmd>SmartSave<CR>", "Wirte and Source this file" },
        ["i"] = { "<cmd>IconPickerNormal<CR>", "insert text icon" },
        ["q"] = { "<cmd>xa<CR>", "exit nvim" },
        ["v"] = { "<cmd>vsplit<CR><cmd>wincmd l<CR>", "Search file" },
        ["l"] = { "<cmd>TagbarToggle<CR>", "toggle tagbar" },

        -- InterestingWords plugin
        ["h"] = { "<cmd>call InterestingWords('n')<CR>", "highlight word" },

        -- LSP control
        ["j"] = { '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "next diagnostic" },
        ["k"] = { '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "prev diagnostic" },
        ["o"] = { '<cmd>lua vim.diagnostic.open_float()<CR>', "open diagnostic" },

        -- ["s"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "save to location list"},

        ["p"]= {
            name = "+Fuzzy find",
            f = {
                "<cmd>lua require(\"telescope.builtin\").find_files({ hidden=true, no_ignore=true, path_display = {\"truncate\"}})<CR>", "Search Files" },
            s = { function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, "Search Symbol" },
            h = { "<cmd>Telescope help_tags<CR>", "open help" },
            m = { "<cmd>Telescope man_pages<CR>", "open man" },
        },
        ["f"] = {
            name = "+file tree",
            o = { "<cmd>NvimTreeFindFile<CR>", "open file in dir" },
            t = { "<cmd>NvimTreeToggle<CR>", "toggle file tree" },
        },

        -- Git:https://github.com/lewis6991/gitsigns.nvim#keymaps
        ["g"] = {
            name = "+Git",
            n = { '<cmd>lua require"gitsigns".next_hunk{preview=true}<CR>', "next change" },
            p = { '<cmd>lua require"gitsigns".prev_hunk{preview=true}<CR>', "prev change" },
            o = { '<cmd>Gitsigns preview_hunk<CR>', "open change" },
            r = { '<cmd>Gitsigns reset_hunk<CR>', "reset change" },
        },
    }, {
        mode = "n",     -- NORMAL mode
        prefix = "<leader>",
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true,  -- use `nowait` when creating keymaps
    })

    -- LSP mappings
    -- vim.keymap.set("n", "gd",  vim.lsp.buf.definition)
    -- vim.keymap.set("n", "K",   vim.lsp.buf.hover)
    -- vim.keymap.set("n", "gi",  vim.lsp.buf.implementation)
    -- vim.keymap.set("n", "gr",  vim.lsp.buf.references)
    -- vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
    -- vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
    -- vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
    -- vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
    -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)


    which_key.register({
        g = {
            name = "goto funciton",
            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "goto function definition" },
            D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "goto function declaration" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "goto function implementation" },
            r = { "<cmd>lua vim.lsp.buf.references()<CR>", "goto function references" },
        },
        K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "show diagnostic hover" },
        --vim.cmd [[ command! format execute 'lua vim.lsp.buf.formatting()' ]]
    }, {
        mode = "n",
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,  -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true,  -- use `nowait` when creating keymaps
    })

    which_key.register({
        ["s"] = { [["hy:%s#<C-r>h#<C-r>h#gcI<left><left><left><left>]], "Amazing Replace" },
    }, {
        mode = "v",     -- NORMAL mode
        prefix = "<leader>",
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = false, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true,  -- use `nowait` when creating keymaps
    })
end

return M
