function sandboxItems() 
    return {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 1, 1, 1, 6, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},

    }
end

function generateItem(num, loc)
    if num == 1 then 
        return Plate:new(loc, "small")
    end

    if num == 2 then 
        return Phones:new(loc, 1)
    end
    if num == 3 then 
        return Phones:new(loc, 2)
    end
    if num == 4 then 
        return Phones:new(loc, 3)
    end
    if num == 5 then 
        return Phones:new(loc, 4)
    end
    if num == 6 then 
        return Phones:new(loc, 5)
    end
    if num == 7 then 
        return Phones:new(loc, 6)
    end

    return nil
end