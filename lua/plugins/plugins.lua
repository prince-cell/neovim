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

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = true,
  },

  -- Lualine: Delayed until first buffer
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("lualine").setup()
    end,
  },

  -- Treesitter: Load on file open
  {
    "nvim-treesitter/nvim-treesitter",
    event = {  "BufWinEnter" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {}
    end,
  },

  -- Bufferline: Load when additional buffers are added
  {
    "akinsho/bufferline.nvim",
    event = "BufAdd",
    config = function()
      require("bufferline").setup {}
    end,
  },

  {
    "folke/noice.nvim",
    cmd = { "Noice", "NoiceDismiss" }, -- load on demand
    config = function()
      require("noice").setup {}
    end,
  },

  {
    "folke/ts-comments.nvim",
    event = "BufReadPost",
    config = function()
      require("ts-comments").setup {}
    end,
  },

  {
    "folke/which-key.nvim",
    keys = "<leader>", -- load when <leader> is pressed
    config = function()
      require("which-key").setup {}
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine"
  },

  -- LazyVim core config
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
