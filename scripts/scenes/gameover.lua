-- GameOver Screen
gameover_fs = flowstate:new({
    update = function (_ENV)
        if btnp(❎) then
            return splash_fs
        end
    end,

    draw = function(_ENV)
        local txt = "g a m e  o v e r"
        print(txt, 64 - (#txt * 2), 60, blink(7,0))
        txt = "press ❎ to start"
        print(txt, 64 - (#txt * 2), 68, blink(7,0))
    end,
})