global = _ENV

-- empty function
_noop = function() end

g_scrn              = { 128, 128 } -- screen size
g_dt                = 0.033        --delta time
g_time              = 0            --total time
g_blink             = 1            -- txt blink increment

function print_bold(text, x, y)
    print(text, x, y - 1, 7)
    print(text, x - 1, y, 7)
    print(text, x, y + 1, 7)
    print(text, x + 1, y, 7)
    print(text, x, y, 0)
end

-- returns colour
function blink(fg_col, bg_col)
    local b_anim = {
        fg_col, fg_col, fg_col, fg_col, fg_col, fg_col,
        bg_col, bg_col, bg_col, bg_col, bg_col, bg_col }
    if global.g_blink > #b_anim then
        global.g_blink = 1
    end
    return b_anim[g_blink]
end

function sign(x)
    return x > 0 and 1 or (x < 0 and -1 or 0)
end

function ssqr(x, y)
    return x * x + y * y
end

function norm(x, y)
    local len_sq = ssqr(x, y)
    if len_sq > 0 then
        return x / sqrt(len_sq), y / sqrt(len_sq)
    else
        return 0, 0
    end
end

-- Check first object's mask with second object's layer
function canCollide(mask, layer)
    return mask & layer ~= 0
end

-- function circle_intersect(a, b)
--     local dx, dy = b.pos_x + b.spr_w/2 - a.pos_x - a.spr_w/2, b.pos_y + b.spr_h/2 - a.pos_y - a.spr_h/2
--     return dx * dx + dy * dy <= (b.rad + a.rad) ^ 2
-- end

function aabb_intersect(a, b)
    return a.spr_x + a.spr_w >= b.spr_x and a.spr_x <= b.spr_x + b.spr_w and
        a.spr_y + a.spr_h >= b.spr_y and a.spr_y <= b.spr_y + b.spr_h
end
