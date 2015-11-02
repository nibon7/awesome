-- {{{ Update volume info
function update_vol_info(widget)
    local info = vicious.widgets.volume(nil, "Master")
    local vol = info[1]
    local mute = info[2]

    widget.text =  mute .. "<span color='green'>" .. vol .. "%</span>"
end
-- }}}

-- {{{ Set volume
function set_vol(widget, mode)
    if not mode then return end

    if mode == "up" then
        os.execute("amixer -q sset Master 2%+ unmuted")
        update_vol_info(widget)
    elseif mode == "down" then
        os.execute("amixer -q sset Master 2%- unmuted")
        update_vol_info(widget)
    elseif mode == "toggle" then
        os.execute("amixer -q sset Master toggle")
        update_vol_info(widget)
    end
end
-- }}}
