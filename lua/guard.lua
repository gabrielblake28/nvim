local M = {}

local namespace = vim.api.nvim_create_namespace("guard")
local config = {
  enabled = true,
  cmd = "commitment-issues-guard",
}

function M.setup(opts)
  config = vim.tbl_extend("force", config, opts or {})
  
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function(args)
      if config.enabled then
        M.check(args.buf)
      end
    end,
  })
  
  vim.api.nvim_set_hl(0, "GuardWarning", { fg = "#fab387", bg = "#313244" })
end

function M.check(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  
  if filepath == "" then
    return
  end
  
  vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
  
  local cmd = string.format('%s --file "%s" --json', config.cmd, filepath)
  
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data and #data > 0 and data[1] ~= "" then
        local output = table.concat(data, "\n")
        local ok, result = pcall(vim.json.decode, output)
        if ok and type(result) == "table" and result.Findings and #result.Findings > 0 then
          M.display_findings(bufnr, result.Findings)
        end
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 and data[1] ~= "" then
        vim.notify("Guard error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
      end
    end,
  })
end

function M.display_findings(bufnr, findings)
  for _, finding in ipairs(findings) do
    local line = finding.Line - 1
    
    vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
      virt_text = {{" ⚠️ " .. finding.Pattern .. " ", "GuardWarning"}},
      virt_text_pos = "eol",
      hl_mode = "combine",
    })
  end
  
  local count = #findings
  local word = count == 1 and "finding" or "findings"
  vim.notify(string.format("Guard: %d %s detected", count, word), vim.log.levels.WARN)
end

function M.toggle()
  config.enabled = not config.enabled
  vim.notify("Guard " .. (config.enabled and "enabled" or "disabled"))
end

return M
