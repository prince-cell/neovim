-- lua/plugins/blink-cmp.lua
return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "none",

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        ["<C-e>"] = { "hide", "fallback" },

        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
        -- Conditional navigation with control over next command execution
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
    },
  },
}
