-- Enable Python auto-formatting with Ruff (imports + formatter)
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    -- Run import sorting first, then code formatting
    opts.formatters_by_ft.python = { "ruff_organize_imports", "ruff_format" }

    -- (Optional) tweak timeouts / fallback
    opts.format_on_save = opts.format_on_save or { timeout_ms = 2000, lsp_fallback = true }

    return opts
  end,
}
