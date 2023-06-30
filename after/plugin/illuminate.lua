local status_ok, vim_illuminate = pcall(require, "illuminate")
if not status_ok then
    return
end

vim_illuminate.configure({
    filetypes_denylist = {
        'NvimTree',
    },
})
