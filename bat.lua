-- {{{ Update battery info
function update_bat_info(widget)
    local info = vicious.widgets.bat(nil, "BAT0")
    local percent = info[2]

    widget.text = "↯<span color='green'>" .. percent .. "%</span>"

    for i = 30, 10, -5 do
        if i == percent then
            naughty.notify({
                title      = "Battery Warning",
                text       = "Battery low! <span color='red'>" .. percent .. "%" .. "</span> left!",
                timeout    = 5,
                opacity    = 0.8,
                position   = "bottom_right"
            })
        end
    end
end
-- }}}
