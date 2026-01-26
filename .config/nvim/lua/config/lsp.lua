vim.lsp.enable('css_ls')
vim.lsp.enable('eslint_ls')
vim.lsp.enable('html_ls')
vim.lsp.enable('json_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('twd_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyrefly')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    -- Enable 'gd' to jump to definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to Definition" })
    -- 'gr' for references (where is this function used?)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf, desc = "Go to References" })
    -- 'K' for hover documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover Documentation" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.opt_local.expandtab = false 
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end,
})
