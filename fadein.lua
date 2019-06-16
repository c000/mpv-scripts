require("mp")

target = mp.get_property_number("volume")
v = 0.0
mp.set_property("volume", v)

function fadein()
    timer = mp.add_periodic_timer(1, function()
        v = v + 1
        mp.set_property("volume", v)
        if target < v then
            mp.set_property("volume", target)
            mp.msg.info("Fade in ended")
            timer:stop()
        end
    end)
end

mp.register_event("file-loaded", fadein)
