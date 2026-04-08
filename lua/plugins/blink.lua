return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
        },
        list = {
          max_items = 20,
        },
        -- Disable blink ghost text to avoid conflict with Supermaven's inline suggestions
        ghost_text = { enabled = false },
      },
      -- Prioritize LSP, then snippets, then path, then buffer words
      sources = {
        default = { "lsp", "snippets", "path", "buffer" },
      },
    },
  },
}
