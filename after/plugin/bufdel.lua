local status_ok, bufdel = pcall(require, "bufdel")
if not status_ok then
    return
end

bufdel.setup {
  next = 'tabs',
  quit = true,  -- quit Neovim when last buffer is closed
}
