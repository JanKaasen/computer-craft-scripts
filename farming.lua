-- TODO:
-- Check for seeds in inventory
-- Check for wheat in inventory
-- Deposit wheat into chest
-- Get fuel from hopper/chest
-- Replant seeds after harvest
-- Harvest
-- Return to starting point after checking the field
-- Check the field for crops that are ready to be harvested

function Refuel()
  for i = 1, 16, 1 do
    local itemData = turtle.getItemDetail()
    if itemData and itemData.name == "minecraft:coal" or "minecraft:charcoal" then
      turtle.select(i)
      turtle.refuel()
    end
  end
end

function CheckGrowth()
  local success, cropData = turtle.inspectDown()
  if success and cropData.state.age == 7 then
    turtle.digDown()
  else
    return
  end
end

function PlantSeed()
  for i = 1, 16 do
    local itemData = turtle.getItemDetail(i)
    if itemData and itemData.name == "minecraft:wheat_seeds" then
      turtle.select(i)
      turtle.placeDown()
      return
    end
  end
end

function HarvestAndPlant()
  CheckGrowth()
  PlantSeed()
end

function MoveForward()
  turtle.forward()
  HarvestAndPlant()
end

function TurnRight()
  turtle.turnRight()
  turtle.forward()
  HarvestAndPlant()
  turtle.turnRight()
end

function TurnLeft()
  turtle.turnLeft()
  turtle.forward()
  HarvestAndPlant()
  turtle.turnLeft()
end

function FarmField()
  local width = 8
  local length = 9

  for y = 1, length do
    for x = 1, width do
      MoveForward()
    end
    if y < length then
      if y % 2 == 1 then
        TurnRight()
      else
        TurnLeft()
      end
    end
  end
end

function ReturnHome()
  turtle.turnLeft()
  for i = 1, 8 do
    turtle.forward()
  end
  turtle.turnLeft()
  for i = 1, 8 do
    turtle.forward()
  end
end

function DropOff()
  for i = 1, 16 do
    turtle.select(i)
    turtle.drop()
  end
end

function TurnAround()
  for i = 1, 2 do
    turtle.turnLeft()
  end
end

function HonestWork()
  Refuel()
  CheckGrowth()
  PlantSeed()
  FarmField()
  ReturnHome()
  DropOff()
  TurnAround()
end

HonestWork()
