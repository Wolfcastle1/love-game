-- location.lua

local Location = {}

function Location.new(x, y)
    return { x = x or 0, y = y or 0 }
end

function Location.copy(loc)
    return { x = loc.x, y = loc.y }
end

function Location.equals(a, b)
    return a.x == b.x and a.y == b.y
end

function Location.move(loc, dx, dy)
    loc.x = loc.x + dx
    loc.y = loc.y + dy
end

function Location.distance(a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    return math.sqrt(dx*dx + dy*dy)
end

function Location.manhattan(a, b)
    return math.abs(a.x - b.x) + math.abs(a.y - b.y)
end

function Location.toString(loc)
    return "(" .. loc.x .. ", " .. loc.y .. ")"
end