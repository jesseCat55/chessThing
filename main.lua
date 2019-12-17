

local screenH = love.graphics.getHeight()
local screenW = love.graphics.getWidth()
local smallerCube = math.min(screenH, screenW)
local maxTilesInScreen = 10
local tileSize = math.floor(smallerCube/maxTilesInScreen)
local xPos = (1.5 * tileSize) + tileSize
local yPos = 1.5 * tileSize
local fps = 50
local timeFromPrevFrame = 0
local pressedKey = ""
local movementSpeed = 5
local prevKeyPressed = ""
local board = require('board')

function love.load()
  board.load()
end

function love.draw()
  board.draw()
  drawPlayer(xPos, yPos)
end

function drawPlayer(x, y)
  love.graphics.setColor(0, 255, 255)
  love.graphics.circle( "fill", x, y, tileSize/2 )
end

function love.keypressed(key, unicode)
  if key == "up" or key == "down" or key == "left" or key == "right" then
    if pressedKey == "" or prevKeyPressed == pressedKey then
    else
      prevKeyPressed = pressedKey
    end
    pressedKey = key
  end
end

function love.update(dt)
  timeFromPrevFrame = timeFromPrevFrame + dt
  if timeFromPrevFrame > 1/fps then
    timeFromPrevFrame = 0
    updatePos()
  end
end

function updatePos()
print("updatePos")
  if pressedKey == "up" and yPos % 1.5 * tileSize == 0 then
    print("move up valid")
    if yPos == 1.5 * tileSize then
      print("died")
    else
      print("moved up")
      yPos = yPos - movementSpeed
      if yPos < 1.5 * tileSize then
        yPos = 1.5 * tileSize
      end
    end
  else
    if pressedKey == "down" and yPos % 1.5 * tileSize == 0 then
      print("move down valid")
      if yPos == tileSize * 8.5 then
        print("died")
      else
        print("moved down")
        yPos = yPos + movementSpeed
        if yPos > tileSize * 8.5 then
          yPos = tileSize * 8.5
        end
      end
    else
      if pressedKey == "left" and xPos % 1.5 * tileSize == 0 then
        print("move left valid")
        if xPos == 1.5 * tileSize then
          print("died")
        else
          print("moved left")
          xPos = xPos - movementSpeed
          if xPos < 1.5 * tileSize then
            xPos = 1.5 * tileSize
          end
        end
      else
        if pressedKey == "right" and xPos % 1.5 * tileSize == 0 then
          print("move right valid")
          if xPos == tileSize * 8.5 then
            print("died")
          else
            print("moved right")
            xPos = xPos + movementSpeed
            if xPos > tileSize * 8.5 then
              xPos = tileSize * 8.5
            end
          end
        else
          print("moved as before")
          moveAsBefore()
        end
      end
    end
  end
end

function moveAsBefore()
if prevKeyPressed == "up" then
    if yPos == 1.5 * tileSize then
      print("died")
    else
      yPos = yPos - movementSpeed
      if yPos < 1.5 * tileSize then
        yPos = 1.5 * tileSize
      end
    end
  end
  if prevKeyPressed == "down" then
    if yPos == tileSize * 8.5 then
      print("died")
    else
      yPos = yPos + movementSpeed
      if yPos > tileSize * 8.5 then
        yPos = tileSize * 8.5
      end
    end
  end
  if prevKeyPressed == "left" then
    if xPos == 1.5 * tileSize then
      print("died")
    else
      xPos = xPos - movementSpeed
      if xPos < 1.5 * tileSize then
        xPos = 1.5 * tileSize
      end
    end
  end
  if prevKeyPressed == "right" then
    if xPos == tileSize * 8.5 then
      print("died")
    else
      xPos = xPos + movementSpeed
      if xPos > tileSize * 8.5 then
        xPos = tileSize * 8.5
      end
    end
  end
end