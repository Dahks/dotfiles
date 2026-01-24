return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local status, configs = pcall(require, "nvim-treesitter.configs")
        if not status then
            return
        end

        configs.setup({
            ensure_installed = {
                "c",
                "javascript",
                "json",
                "lua",
                "python",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
