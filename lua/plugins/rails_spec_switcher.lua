return {
  {
    dir = "/home/egrace/work/rails_spec_switcher", -- Path to the local plugin
    config = function()
      require("rails_spec_switcher")
    end,
    lazy = true, -- Load lazily
    cmd = "OpenSpecFile", -- Load when the command is called
  },
}
