local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

null_ls.setup({
    debug = true;
    sources = {
        null_ls.builtins.formatting.verible_verilog_format,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.clang_format,
    },
})

