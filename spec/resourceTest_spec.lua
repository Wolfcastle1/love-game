require("src/items/item")
local resource = require("src/items/resources/resource")

describe("Resource Tests: ", function()

    local testResource

    before_each(function()
        testResource = Resource:new("test", 10)
    end)


    it("Resource Constructor", function()
        local name = "testName"
        local amount = 10
        local resource = Resource:new(name, amount)
        assert.are.equal(name, resource.name)
        assert.are.equal(amount, resource.amount)
    end)
    
    it("Resource Change Amount", function()
        testResource:changeAmount(100)
        assert.are.equal(110, testResource.amount)
    end)

end)

