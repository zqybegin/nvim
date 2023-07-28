local M = {
    "ziontee113/icon-picker.nvim", -- help you pick text icon
    event = "VeryLazy",
    dependencies = {
        "stevearc/dressing.nvim", -- icon picker needed
    },
}


function M.config()
    require("icon-picker").setup {
        disable_legacy_commands = true
    }
end

return M
