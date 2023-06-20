local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

local rose_highlights = require('rose-pine.palette')

bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true,-- | false, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none", --| "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = nil, -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'none', -- 'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains:
            -- name                | str        | the basename of the active file
            -- path                | str        | the full path of the active file
            -- bufnr (buffer only) | int        | the number of the active buffer
            -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
            -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        -- end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = false, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = false, -- false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     return "("..count..")"
        -- end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number, buf_numbers)
        --     -- filter out filetypes you don't want to see
        --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --         return true
        --     end
        --     -- filter out by buffer name
        --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --         return true
        --     end
        --     -- filter out based on arbitrary rules
        --     -- e.g. filter out vim wiki buffer from tabline in your work repo
        --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --         return true
        --     end
        --     -- filter out by it's index number in list (don't show first buffer)
        --     if buf_numbers[1] ~= buf_number then
        --         return true
        --     end
        -- esd,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer", --| function ,
                text_align = "center",-- left" | "center" | "right"
                separator = false,
            }
        },
        color_icons = false, -- true | false, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
        show_buffer_close_icons = true, -- true | false,
        show_close_icon = true, -- true | false,
        show_tab_indicators = false , -- true | false,
        show_duplicate_prefix = false, -- true | false, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocusefalse '|', '|' }
        separator_style = "slant", --"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false, --false | true,
        always_show_bufferline = true, --true | false,
        hover = {
            enabled = false,
            delay = 200,
            reveal = {'close'}
        },
        -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --     -- add custom logic
        --     return buffer_a.modified > buffer_b.modified
        -- end
    },
    highlights = {
        fill = {
            bg = rose_highlights.highlight_med,
        },
        separator_selected = {
            fg = rose_highlights.highlight_med,
        },
        separator_visible = {
            fg = rose_highlights.highlight_med,
        },
        separator = {
            fg = rose_highlights.highlight_med,
        },
        offset_separator = {
            fg = rose_highlights.highlight_med,
        },
        --  Other buffers which are not visible or don't have cursor 
        background = {
            fg = "#908caa",
            bg = { attribute = "bg", highlight = "Comment" }
        },
        -- The buffer show when cursor enter the file-tree
        buffer_visible = {
            fg = "#908caa",
            bg = { attribute = "bg", highlight = "Comment" }
        },
        -- The buffer where the cursor is located in
        buffer_selected = {
            fg = "#FFFFFF",
            bg = { attribute = "bg", highlight = "Comment" },
            bold = true,
            italic = true,
        },
        close_button = {
            fg = "#908caa",
            bg = { attribute = "bg", highlight = "Normal"  }
        },
        close_button_visible = {
            fg = "#FFFFFF",
            bg = { attribute = "bg", highlight = "Comment" }
        },
        close_button_selected = {
            fg = "#FFFFFF",
            bg = { attribute = "bg", highlight = "Comment" }
        },
        -- indicator_visible = {
        --     fg = "#ea9a97",
        --     bg = "#ea9a97",
        --     sp = "#ea9a97",
        -- },
        -- indicator_selected = {
        --     fg = "#ea9a97",
        --     bg = "#ea9a97",
        --     sp = "#ea9a97",
        --     -- bg = { attribute = "bg", highlight = "Comment" }
        -- },
    };
}
vim.keymap.set("n","<leader><leader>s","<cmd>w<CR><cmd>so<CR><cmd>PackerCompile<CR>")
