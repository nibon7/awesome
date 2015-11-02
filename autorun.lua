local autorun = true
local autorun_apps = {
    "xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55",
    "fcitx-autostart",
    "gsettings-data-convert",
    "nm-applet",
    "start-pulseaudio-x11",
    "/usr/bin/gnome-keyring-daemon --start --components=gpg",
    "/usr/bin/gnome-keyring-daemon --start --components=pkcs11",
    "/usr/bin/gnome-keyring-daemon --start --components=secrets",
    "/usr/bin/gnome-keyring-daemon --start --components=ssh",
    "/usr/libexec/at-spi-bus-launcher --launch-immediately",
    "/usr/libexec/notification-daemon",
    "/usr/libexec/polkit-gnome-authentication-agent-1",
    "/usr/bin/xscreensaver -no-splash",
}

function run_once(cmd)
    awful.util.spawn_with_shell("pgrep -u " .. os.getenv("USER") .. " -f -x " .. cmd .. " >/dev/null || (" .. cmd .. ")") 
end

if autorun then
    for i = 1, #autorun_apps do
        run_once(autorun_apps[i])
    end
end
