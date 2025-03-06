-- Base class from all objects are derived from
class = setmetatable(
    {
        label = "class",
        parents = {},
        children = {},

        extend = function (_ENV,tbl)
            tbl = tbl or {}
            tbl.__index = tbl
            tbl.parents = {}
            tbl.super = _ENV

            for p in all(_ENV.parents) do
                add(tbl.parents, p)
            end

            add(tbl.parents, _ENV)

            setmetatable(tbl, {
                __index = _ENV,
                __call = tbl.call
            })

            return tbl
        end,

        is = function(_ENV, klass)
            return _ENV.class == klass or count(parents, klass) > 0
          end,

        new = function(_ENV, tbl)
            tbl = tbl or {}
            setmetatable(tbl, { __index = _ENV })
            tbl.class = _ENV
            tbl:init()
            return tbl
        end,

        init = _noop

    }, { __index = _ENV }
)
class.__index = class