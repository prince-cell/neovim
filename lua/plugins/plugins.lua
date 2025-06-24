-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        omnisharp = function(_, opts)
          local on_attach = opts.on_attach
          opts.on_attach = function(client, bufnr)
            if client.name == "omnisharp_mono" then
              local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
              for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = v:gsub(" ", "_")
              end
              local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
              for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = v:gsub(" ", "_")
              end
            end
            if on_attach then on_attach(client, bufnr) end
          end
        end,
      },
    },
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000, enabled = true
  },
  {
     "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
  },
  },
}
