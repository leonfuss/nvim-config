P = function(v)
  print(vim.inspect(v))
  return v
end


RELOAD = function(...)
  local status, plenary_reload = pcall(require,"plenary.reload")
  if not status then
    return
  end
  return plenary_reload.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
