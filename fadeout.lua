require("mp")

t = mp.get_opt("t")
if t == nil then
    t = 60 * 60
end
mp.msg.info("t =", t, "seconds")

timer = mp.add_periodic_timer(1, function()
    remain = t - mp.get_time()
    if remain <= 0 then
        mp.command("quit")
    end
    if 100 < remain then
        mp.set_property("volume", 100)
    else
        mp.set_property("volume", remain)
    end
end)
