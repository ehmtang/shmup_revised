-- Base object class
baseobject = class:extend({
    init = _noop,
    update = _noop,
    draw = _noop
})

-- Base gameobject class
gameobject = baseobject:extend({
    label = "gameobject",
    active = false,

    -- position, velocity, acceleration
    px = 0,
    py = 0,
    vx = 0,
    vy = 0,
    ax = 0,
    ay = 0,

    -- sprite
    spr_id = 0,
    width = 0,
    height = 0,

    -- animation
    frame = 0,
    frame_pos = 0,
    nframes = 0,
    anim_spd = 0,

    init = _noop,

    update = function(_ENV)
        -- update animation
        frame_pos += anim_spd
        if frame_pos > 1 then
            frame += 1
            frame_pos -= 1

            if frame >= nframes then
                frame = 0
            end
        end

        -- update sprite
        -- spr_x = pos_x
        -- spr_y = pos_y

        -- update physics
        vx += ax
        vy += ay
        px += vx
        py += vy
    end,

    draw = function(_ENV)
        spr(spr_id + frame, px, py)
    end,
})

-- GameObject Manager Instance
gameobject_manager = class:new({
    gameobjects = {},

    update = function(_ENV)
        _ENV:delete_inactive()
        foreach(gameobjects, function(obj) obj:update() end)
    end,

    draw = function(_ENV)
        foreach(gameobjects, function(obj) obj:draw() end)
    end,

    delete_inactive = function(_ENV)
        for obj in all(gameobjects) do
            if not obj.active then
                del(gameobjects, obj)
            end
        end
    end,

    clear_all = function(_ENV)
        gameobjects = {}
    end
})
