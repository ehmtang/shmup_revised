-- Base flowstate class 
flowstate = class:extend({
    enter = _noop,
    update = _noop,
    draw = _noop,
    exit = _noop,
})

-- Flowstate Manager Instance
flowstate_manager = class:new({
    fstate = flowstate:new(),
    new_state = nil,

    update_state = function(_ENV)
        new_state = fstate:update()
        if (new_state ~= nil) then
            _ENV:set_state(new_state)
            new_state = nil
        end
    end,

    draw_state = function(_ENV)
        fstate:draw()
    end,

    set_state = function(_ENV, fs)
        fstate:exit()
        fstate = fs
        fstate:enter()
    end
})