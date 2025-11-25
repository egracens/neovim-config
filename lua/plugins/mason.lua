return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = vim.tbl_filter(function(name)
      return not vim.tbl_contains({ "erb-formatter" }, name)
    end, opts.ensure_installed)
  end,
}
