vim.api.nvim_create_user_command("StartSassServer", function()
  vim.fn.jobstart "sass --watch sass:css"
  vim.fn.jobstart "live-server --no-css-inject"
  print "SASS and Live Server started!"
end, {})

vim.api.nvim_create_user_command("StopSassServer", function()
  vim.fn.jobstart "pkill -f sass"
  vim.fn.jobstart "pkill -f live-server"
  print "SASS and Live Server stopped!"
end, {})
