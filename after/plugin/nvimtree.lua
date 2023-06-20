local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
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
        ignore = true,
        timeout = 500,
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✗",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
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
    }
}
