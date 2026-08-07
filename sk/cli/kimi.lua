---@type sidekick.cli.Config
return {
  cmd = { "kimi" },
  is_proc = "\\<kimi\\>",
  url = "https://github.com/MoonshotAI/kimi-cli",
  resume = { "--resume" },
  continue = { "--continue" },
  format = function(text)
    local Text = require("sidekick.text")

    -- quote file paths that contain special characters (e.g. spaces),
    -- so kimi's `@` path completion doesn't mangle them
    Text.transform(text, function(str)
      return str:find("[^%w/_%.%-]") and ('"' .. str .. '"') or str
    end, "SidekickLocFile")
  end,
}
