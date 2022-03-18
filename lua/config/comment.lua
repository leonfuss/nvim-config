local status, comment = pcall(require, 'Comment')
if not status then
    print("Comment failed to load")
    return
end

comment.setup()
