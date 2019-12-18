local class = require('./lib/Class')
local Board = class:derive('Board')

function Board:new(maxTilesInScreen, tileSize)
  self.maxTilesInScreen = maxTilesInScreen
  self.tileSize = tileSize
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.setBackgroundColor(0, 0, 0)
end

function Board:update(dt)
end

function Board:draw()
  local mode = 1
    local theMode
    -- 1, maxTilesInScreen - 2 -> create an offset of 1 tile size from (0,0)
    for i =1, self.maxTilesInScreen - 2, 1 do
      for j = 1, self.maxTilesInScreen - 2, 1 do
        if mode == 1 then
          love.graphics.setColor(140, 0, 255)
        else
          love.graphics.setColor(10, 255, 10)
        end
        mode = 1 - mode
        love.graphics.rectangle("fill", j*self.tileSize, i*self.tileSize, self.tileSize, self.tileSize )
      end
      mode = 1 - mode
    end
end

return Board