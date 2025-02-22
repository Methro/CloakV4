_G.core = {}
dofile("builtin/common/math.lua")
<<<<<<< HEAD
=======

>>>>>>> 5.10.0
describe("math", function()
	it("round()", function()
		assert.equal(0, math.round(0))
		assert.equal(10, math.round(10.3))
		assert.equal(11, math.round(10.5))
		assert.equal(11, math.round(10.7))
		assert.equal(-10, math.round(-10.3))
		assert.equal(-11, math.round(-10.5))
		assert.equal(-11, math.round(-10.7))
		assert.equal(0, math.round(0.49999999999999994))
		assert.equal(0, math.round(-0.49999999999999994))
	end)
<<<<<<< HEAD
end)
=======
end)
>>>>>>> 5.10.0
