function Comments()
    local exists, comment = pcall(require, "Comment")
    if exists then
        comment.setup({})
    end
end

Comments()
