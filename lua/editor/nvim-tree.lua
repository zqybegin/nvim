local M = {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeFindFile", "NvimTreeToggle" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",     -- file tree icon
    },
}

function M.config()
    -- following options are the default
    -- each of these are documented in `:help nvim-tree.OPTION_NAME`
    require("nvim-tree").setup {
        disable_netrw = true, -- Completely disable netrw
        hijack_cursor = true, -- Keeps the cursor on the first letter of the filename when moving in the tree.
        -- Window / buffer setup.
        view = {
            -- A table indicates that the view should be dynamically sized based on the longest line
            width = {
                min = 5,
                max = 35,
            },
        },
        -- Show LSP and COC diagnostics in the signcolumn
        diagnostics = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 500,
        },
        -- UI rendering setup
        renderer = {
            highlight_git = true, -- Enable file highlight for git attributes
            indent_markers = {
                enable = true,
            },
            icons = {
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        deleted = "",
                        untracked = "υ",
                        ignored = "◌",
                    },
                    folder = {
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                    },
                }
            }
        },
    }
end

return M
