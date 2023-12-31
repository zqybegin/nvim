local M = {
    'kevinhwang91/nvim-ufo', -- make Neovim's fold look modern and keep high performance
    event = { "BufRead", "BufNewFile" },
    dependencies = {
        'kevinhwang91/promise-async',
        'luukvbaal/statuscol.nvim'
    }
}

function M.config()
    -- beautiful icon: https://github.com/kevinhwang91/nvim-ufo/issues/4
    vim.o.foldcolumn = '1'  -- '0' is not bad
    vim.o.foldlevel = 99    -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true -- Disable folding at startup
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    require("statuscol").setup(
        {
            relculright = true,
            segments = {
                { text = { require("statuscol.builtin").foldfunc },      click = "v:lua.ScFa" },
                { text = { "%s" },                                       click = "v:lua.ScSa" },
                { text = { require("statuscol.builtin").lnumfunc, " " }, click = "v:lua.ScLa" }
            }
        }
    )

    -- Adding number suffix of folded lines instead of the default ellipsis
    local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
            else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, { chunkText, hlGroup })
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                -- str width returned from truncate() may less than 2nd argument, need padding
                if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                end
                break
            end
            curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
    end


    -- buffer scope handler
    -- will override global handler if it is existed
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- require('ufo').setFoldVirtTextHandler(bufnr, handler)
    require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end,
        fold_virt_text_handler = handler
    })
end

return M
