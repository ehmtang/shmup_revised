player = gameobject:extend({
    label = "gameobject",

    -- position, velocity, acceleration
    vx = 0,
    vy = 0,
    ax = 0,
    ay = 0,

    -- sprite
    width = 0,
    height = 0,

    -- animation
    frame = 0,
    frame_pos = 0,
    nframes = 0,
    anim_spd = 0,

    init = function(_ENV)
        active = true
        spr_id = 17
        px = 64
        py = 64
        add(gameobject_manager.gameobjects, _ENV)
    end,

    update = function(_ENV)
        _ENV:controls()
        gameobject:update()
    end,

    draw = function(_ENV)
        rect(px, py, px+8, py+8,7 )
        spr(spr_id + frame, px, py)
    end,

    controls = function(_ENV)
        if btn(⬅️) then
            px -= 1
        elseif btn(➡️) then
            px += 1
        end

        if btn(⬆️) then
            py -= 1
        elseif btn(⬇️) then
            py += 1
        end

        -- ax = 0
        -- ay = 0

        -- if btn(⬅️) then
        --     ax = -1
        -- elseif btn(➡️) then
        --     ax = 1
        -- end

        -- if btn(⬆️) then
        --     ay = -1
        -- elseif btn(⬇️) then
        --     ay = 1
        -- end

        -- ax, ay = norm(ax, ay)
    end
})
