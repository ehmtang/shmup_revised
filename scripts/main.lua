-- Initialise function
function _init()
    cls()
    flowstate_manager:set_state(splash_fs)
end

-- Update function
function _update60()
    g_time += g_dt
    flowstate_manager:update_state()
    gameobject_manager:update()
end

-- Draw function
function _draw()
    cls(3)
    flowstate_manager:draw_state()
    gameobject_manager:draw()
end