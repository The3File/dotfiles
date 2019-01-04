# thememenu - because one theme isn't enough

A simple script that opens a dmenu with all available theme options and then replaces (links) `~/.Xresources` with it. It then restarts i3 via i3-msg reload and calls stmessage.

If you want to use it, you need to replace the path in the `thememenu` file.

# stmessage

A simple C application that sends an XClientMessageEvent to all running st instances to tell them to reload colors.

This requires [a specific patch for st](https://github.com/PaxPlay/st/commit/de7ab87871fdd861b1f0a83899dca6402212c7b4).
