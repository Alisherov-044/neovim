local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            debug = true,
            command = "prettier",
            filetypes = {
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
                "json",
                "css",
                "scss",
                "svelte",
                "lua",
                "html"
            }
        })
    }
})

vim.cmd [[
    augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.jsx,*.ts,*.jsx,*.css,*.scss,*.json,*.svelte,*.html,*.lua lua vim.lsp.buf.format()
    augroup END
]]

vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format({ async = true })<CR>", { noremap = true, silent = true })
