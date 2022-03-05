local status, feline = pcall(require,"feline")
if not status then
    print("feline failed to load")
    return
end

feline.setup()
