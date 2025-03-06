-- Level
level_fs = flowstate:new({

    scroll = 64,
    map_segments = {},
    player_1 = nil,

    enter = function (_ENV)

        for index = 0, 31 do
            local j = flr(index / 4)
            local i = 3 - (index % 4)
            
            add(map_segments, {
                mx = 16 * j,
                my = 8 * i,
            })
        end

        player_1= player:new({
            spr_id = 17
        })
        

    end,
    
    update = function(_ENV)
        scroll += 0.5
    end,

    draw = function(_ENV)

        -- cycle once
        -- for i = 1, #map_segments do
        --     local mp = map_segments[i]
        --     local scroll_y = scroll - (i-1)*64
        --     map(mp.mx, mp.my, 0, scroll_y, 16, 8)
        -- end

        -- local loop_height = #map_segments * 64
        -- local wrapped_scroll = scroll % loop_height
    
        -- for i = 1, #map_segments do
        --     local mp = map_segments[i]
        --     local scroll_y = (wrapped_scroll - (i-1)*64) % loop_height
    
        --     map(mp.mx, mp.my, 0, scroll_y, 16, 8)
        --     map(mp.mx, mp.my, 0, scroll_y - loop_height, 16, 8)
        -- end
    end,

    exit = _noop

})
