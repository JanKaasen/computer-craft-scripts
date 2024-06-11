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
    if itemData.name == "minecraft:coal" or "minecraft:charcoal" then
      turtle.select(i)
      turtle.refuel()
    end
  end
end

function CheckGrowth()
  local cropData = turtle.inspectDown()
  if cropData.state.age == 7 then
    turtle.digDown()
  end
end

function PlantSeed()
  for i = 1, 16, 1 do
    local itemData = turtle.getItemDetail(i)
    if itemData.name == "minecraft:wheat_seeds" then
      turtle.select(i)
      turtle.placeDown()
    end
  end
end

function HarvestAndPlant()
  CheckGrowth()
  PlantSeed()
end
