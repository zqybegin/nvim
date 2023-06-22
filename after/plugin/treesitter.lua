-- if plugin isn't loaded, only return and don't report error
local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_status_ok then
    return
end

treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {"verilog", "vimdoc", "c", "lua", "rust" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },

    -- Plugin nvim-autopairs needed
    autopairs = {
        enable = true,
    },
    -- Plugin nvim-ts-rainbow needed
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
-- colors group set in rainbow
-- vim.cmd('highlight  rainbowcol1  guifg=#8be9fd')
-- vim.cmd('highlight  rainbowcol2  guifg=#bd93f9')
-- vim.cmd('highlight  rainbowcol3  guifg=#FDC1AA')
-- vim.cmd('highlight  rainbowcol5  guifg=#d65d0e')
-- vim.cmd('highlight  rainbowcol4  guifg=#50fa7b')
-- vim.cmd('highlight  rainbowcol6  guifg=#ffb86c')

-- if plugin isn't loaded, only return and don't report error
local context_status_ok, treesitter_context = pcall(require, 'treesitter-context')
if not context_status_ok then
    return
end

treesitter_context.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
