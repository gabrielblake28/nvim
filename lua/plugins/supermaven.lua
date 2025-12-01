return {
    {
      "supermaven-inc/supermaven-nvim",
      event = "InsertEnter",  -- optional, but nice to lazy-load
      config = function()
        require("supermaven-nvim").setup({
            
          -- put any Supermaven options here
        })
      end,
    },
  }
  