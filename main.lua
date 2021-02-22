-- Set to false to allow scales that will have uneven pixels
local intScaling = true

local canvas
local light = {0.694118, 0.682353, 0.658824}
local dark = {0.195313,0.183594,0.160156}
local w = 400
local h = 240
local scale = 1


function love.load()
  -- set rescaling filter
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- Black for pillars
  love.graphics.setBackgroundColor(0,0,0)

  -- Light colour for all drawing
  love.graphics.setColor(light)

  -- Create canvas
	canvas = love.graphics.newCanvas(w, h)

end

function testPattern(density)
  for x = 1, w/density do
    for y = 1, h/density do
      love.graphics.rectangle("fill", x*density, y*density, 1,1)
    end
  end
end


function love.draw()

  love.graphics.setCanvas(canvas)
    -- Do all your drawing here

    -- Dark colour for everything by default
    love.graphics.clear(dark)
    -- Draw a grid of 1x1 pixels
    testPattern(2)

  -- End of drawing
  love.graphics.setCanvas()

  -- Center the cavas
  local xpos = math.floor( (love.graphics.getWidth() - w*scale)/2 )
  local ypos = math.floor( (love.graphics.getHeight() - h*scale)/2 )
  love.graphics.draw(canvas, xpos, ypos, 0, scale, scale)

end

function love.resize(width, height)

  -- Recalculate what to scale the game at
  scale = math.min(width/w, height/h)

  if intScaling then
    scale = math.floor(scale)
  end

end
