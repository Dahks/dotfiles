return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp", -- Assuming you use blink based on your file list
        "williamboman/mason-lspconfig.nvim", -- Optional
    },
    config = function()
        -- We will load your separate config file here to ensure
        -- it only runs AFTER the plugin is installed.
        require("config.lsp") 
    end,
}
