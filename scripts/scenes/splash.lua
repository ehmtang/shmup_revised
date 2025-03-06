-- Splash Screen
splash_fs = flowstate:new({
    update = function (_ENV)
        if btnp(❎) then
            return level_fs
        end
    end,

    draw = function(_ENV)
        local txt = "splash"
        print(txt, 64 - (#txt * 2), 60, blink(7,0))
        txt = "press ❎ to start"
        print(txt, 64 - (#txt * 2), 68, blink(7,0))
    end,
})
