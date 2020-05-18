local BSODTimer

function renderBSOD()
 local x, y = guiGetScreenSize();
 dxDrawImage (0, 0, x, y, "bs.jpg")
end

addEvent ("showBSODToPlayer", true)
addEventHandler ("showBSODToPlayer", getRootElement(), function (thePlayer)
  if (thePlayer == getLocalPlayer()) then
    if (isTimer(BSODTimer)) then
      killTimer(BSODTimer)
    end

    showChat(false)
    setPlayerHudComponentVisible ("all", false)
    local sound = playSound("s1.mp3")
    setSoundVolume(sound, 0.5)

    removeEventHandler ("onClientRender", getRootElement(), renderBSOD)
    addEventHandler ("onClientRender", getRootElement(), renderBSOD)

   BSODTimer = setTimer(function ()
     removeEventHandler("onClientRender", getRootElement(), renderBSOD)
     showChat(true)
     setPlayerHudComponentVisible ("all", true)
    end, 5000, 1)
  end
end)

addEvent ("showBSODToPlayer1", true)
addEventHandler ("showBSODToPlayer", getRootElement(), function (thePlayer)
  if (thePlayer == getLocalPlayer()) then
    if (isTimer(BSODTimer)) then
      killTimer(BSODTimer)
    end

    showChat(false)
    setPlayerHudComponentVisible ("all", false)
    local sound = playSound("s1.mp3")
    setSoundVolume(sound, 0.5)

    removeEventHandler ("onClientRender", getRootElement(), renderBSOD)
    addEventHandler ("onClientRender", getRootElement(), renderBSOD)

   BSODTimer = setTimer(function ()
     removeEventHandler("onClientRender", getRootElement(), renderBSOD)
     showChat(true)
     setPlayerHudComponentVisible ("all", true)
    end, 5000, 1)
  end
end)