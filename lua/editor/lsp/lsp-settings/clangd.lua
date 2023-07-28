return {
    -- fix bug:https://www.reddit.com/r/neovim/comments/12qbcua/multiple_different_client_offset_encodings/
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}
