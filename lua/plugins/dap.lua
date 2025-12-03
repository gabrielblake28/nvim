-- lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function(_, _)
      local dap = require("dap")

      local js_based_languages = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }

      -- DAP will run `npm run dev` for you under the debugger
      local launch_backend = {
        type = "pwa-node",
        request = "launch",
        name = "Launch backend (npm run dev)",
        runtimeExecutable = "npm",
        runtimeArgs = { "run", "dev" },
        cwd = vim.fn.getcwd(),
        console = "integratedTerminal",
      }

      for _, lang in ipairs(js_based_languages) do
        dap.configurations[lang] = { launch_backend }
      end
    end,
    keys = {
      {
        "<leader>dC",
        function()
          local dap = require("dap")
          if dap.session() then
            dap.run_to_cursor()
          else
            dap.continue() -- starts `npm run dev` under the debugger
          end
        end,
        desc = "Run to Cursor / Launch backend",
      },
    },
  },
}
