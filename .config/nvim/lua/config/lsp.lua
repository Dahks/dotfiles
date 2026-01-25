vim.lsp.enable('clang_ls')
vim.lsp.enable('css_ls')
vim.lsp.enable('eslint_ls')
vim.lsp.enable('html_ls')
vim.lsp.enable('json_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('twd_ls')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function(args)
    local root_markers = {
        'pyrefly.toml',
        'pyproject.toml',
        'setup.py',
        'requirements.txt',
        '.git',
    }

    local root_dir = vim.fs.root(args.buf, root_markers)

    if root_dir then
      vim.lsp.start({
        name = 'pyrefly',
        cmd = { 'pyrefly', 'lsp' },
        root_dir = root_dir,
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })
    end
  end,
})
