-- https://github.com/mpv-player/mpv/issues/6592
function on_pause_show_osc(name, value)
    if value == true then
        delayed(0, "no-osd set osd-level 0")
        delayed(0.1, "script-message osc-visibility always")
        delayed(0.3, "no-osd set osd-level 1")
    else
        delayed(0, "no-osd set osd-level 0")
        delayed(0.1, "script-message osc-visibility auto")
        delayed(0.3, "no-osd set osd-level 1")
    end
end

function delayed(t, c)
   mp.add_timeout(t, function() mp.command(c) end)
end

mp.observe_property("pause", "bool", on_pause_show_osc)
