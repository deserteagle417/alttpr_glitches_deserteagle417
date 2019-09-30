--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")

Tracker:AddItems("items/common.json")
Tracker:AddItems("items/dungeon_items.json")
Tracker:AddItems("items/labels.json")

-- If current version is keysanity, add all keys, otherwise only add TR and GT big keys
if not (string.find(Tracker.ActiveVariantUID, "keys")) then
    Tracker:AddItems("items/keys_TRGT.json")
    Tracker:AddLocations("locations/dungeons.json")
else
    Tracker:AddItems("items/keys.json")
    Tracker:AddLocations("keysanity/locations/dungeons.json")
end

ScriptHost:LoadScript("scripts/logic_common.lua")
ScriptHost:LoadScript("scripts/logic_custom.lua")
Tracker:AddMaps("maps/maps.json")
if not (string.find(Tracker.ActiveVariantUID, "inverted")) then
    Tracker:AddLocations("locations/overworld.json")
else
    Tracker:AddLocations("inverted_locations/overworld.json")
end 

-- If current version is keysanity, use keysanity dungeon logic
if not (string.find(Tracker.ActiveVariantUID, "keys")) then
    Tracker:AddLocations("locations/dungeons.json")
else
    Tracker:AddLocations("keysanity/locations/dungeons.json")
end

Tracker:AddLayouts("layouts/tracker.json")

-- Select a broadcast view layout based on whether the current variant is keysanity or not
if not (string.find(Tracker.ActiveVariantUID, "keys")) then
    Tracker:AddLayouts("layouts/standard_broadcast.json")
else
    Tracker:AddLayouts("layouts/keysanity_broadcast.json")
end

if _VERSION == "Lua 5.3" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
else    
    print("Auto-tracker is unsupported by your tracker version")
end
