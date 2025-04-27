require("src/props/prop")
Location = require("src/util/location")

describe("Prop Tests: ", function() 

    local prop

    before_each(function() 
        prop = Prop:new("test", Location.new(10, 10), 1)
    end)

    it("rotationDegree", function() 
        assert.are.equal(90, prop:rotationDegree())
        prop.rotation = 2 
        assert.are.equal(180, prop:rotationDegree())
        prop.rotation = 2.5
        assert.are.equal(225, prop:rotationDegree())
    end)

end)