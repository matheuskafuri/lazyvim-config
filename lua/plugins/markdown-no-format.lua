-- Desabilita format-on-save para Markdown/MDX no Conform, mantendo o resto igual
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    -- Não usar nenhum formatter para markdown/mdx
    opts.formatters_by_ft.markdown = {}
    opts.formatters_by_ft.mdx = {}

    -- Pular format_on_save se for markdown/mdx
    local orig = opts.format_on_save
    opts.format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == "markdown" or ft == "mdx" then
        return nil -- não formata ao salvar
      end
      if type(orig) == "function" then
        return orig(bufnr)
      end
      return orig or { timeout_ms = 1000, lsp_fallback = true }
    end

    return opts
  end,
}
