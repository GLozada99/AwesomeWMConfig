local awful = require("awful")

awful.spawn.with_shell("setxkbmap -layout us")
awful.spawn.with_shell("xmodmap -e 'keycode 105 = Multi_key'")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("variety --resume")
-- awful.spawn.with_shell("bash /home/gustavolozada/.config/polybar/start.sh")
-- awful.spawn.with_shell("nm-applet")
-- awful.spawn.with_shell("kmix")
