local utilities = require("utilities")

describe("Movement Tests: ", function() 
    
    it("MoveX", function() 
        local player = {x = 0}
        MoveX(player, 5)
        assert.are.equal(5, player.x)
    end)
    
    it("MoveY", function() 
        local player = {y = 0}
        MoveY(player, 5)
        assert.are.equal(5, player.y)
    end)

end)

