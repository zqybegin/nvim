local M = {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diagnostics'},
            lualine_c = {
                {
                    'filename',
                    file_status = true,      -- Displays file status (readonly status, modified status)
                    newfile_status = false,  -- Display new file status (new file means no write after created)
                    path = 3,                -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory

                    shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                    -- for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = '[+]',      -- Text to show when the file is modified.
                        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]',     -- Text to show for newly created file before first write
                    }
                },
                'g:metals_status'
            },
            lualine_x = {'encoding'},
            lualine_y = {'filetype'},
            lualine_z = {'progress'},
        },
        inactive_sections = {},
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end

return M
