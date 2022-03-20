local status, fidget = pcall(require, "fidget")
if not status then
    print("Fidget failed to load")
    return
end

fidget.setup{}
