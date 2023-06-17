-- if plugin isn't loaded, only return and don't report error
local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
    return
end

comment.setup()
