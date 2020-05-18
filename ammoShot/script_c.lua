local allowedWeapons = {}
local customDamage = { }

addEventHandler("onClientResourceStart", getRootElement(), function(startedResource)
    if (startedResource == getThisResource()) then
        local xml = xmlLoadFile("oneclick.ignore.xml")
        for _, node in ipairs(xmlNodeGetChildren(xml)) do
            if (xmlNodeGetName(node) == "weapon") then
                table.insert(allowedWeapons, tonumber(xmlNodeGetAttribute(node, "id")))
            end 
        end 
    end 
end)

addEventHandler("onClientPlayerWeaponFire", getRootElement(), function(weapon)
    local isAllowedCheck = false
    for _, k in ipairs(allowedWeapons) do
        if (weapon == k) then
            isAllowedCheck = true
            break
        end 
    end
    
    if not isAllowedCheck then
        setPedControlState("fire", false)
    end 
end)