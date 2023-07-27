local M = {
    "hrsh7th/nvim-cmp", -- The completion plugin
    event = { "InsertEnter", "CmdlineEnter", },
    dependencies = {
        "hrsh7th/cmp-buffer",       -- source of buffer completions
        "hrsh7th/cmp-path",         -- source of path completions
        -- "hrsh7th/cmp-cmdline",      -- source of cmdline completions
        "hrsh7th/cmp-nvim-lsp",     -- source of lsp completions
        "hrsh7th/cmp-nvim-lua",     -- source of nvim config completions
        "saadparwaiz1/cmp_luasnip", -- source of snippet completions
        "L3MON4D3/LuaSnip",         -- snippet engie
    },
}

function M.config()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    -- use in cmp.setup.mapping
    local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    -- find more here: https://www.nerdfonts.com/cheat-sheet
    --   פּ ﯟ   some other good icons
    local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }

    cmp.setup {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-p"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<Tab>"] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_next_item()
                -- elseif luasnip.expandable() then
                if luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, { "i", "s", }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                -- if cmp.visible() then
                --     cmp.select_prev_item()
                -- elseif luasnip.jumpable(-1) then
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                elseif luasnip.expand_or_jumpable(-1) then
                    luasnip.expand_or_jump(-1)
                else
                    fallback()
                end
            end, { "i", "s", }),
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                -- ADD-SOURCE
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[LUA]",
                    luasnip  = "[Snippet]",
                    buffer   = "[Buffer]",
                    path     = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        -- ADD-SOURCE
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = false,
            native_menu = false,
        },
    }
end

return M
