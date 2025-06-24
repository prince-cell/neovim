return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local tmux = require("tmux-status")

    -- Add tmux components to lualine_c
    table.insert(opts.sections.lualine_c, {
      tmux.tmux_windows,
      cond = tmux.show,
      padding = { left = 3 },
    })

    -- Add tmux session to lualine_z
    table.insert(opts.sections.lualine_z, {
      tmux.tmux_session,
      cond = tmux.show,
      padding = { left = 3 },
    })
  end,
}
