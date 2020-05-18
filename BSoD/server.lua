addCommandHandler ("bsod", function (thePlayer, _, playerName)
  if not playerName then
    return outputChatBox ("SYNTAX: /bsod player", thePlayer, 255, 0, 0)
  end

  local player = getPlayerFromName (playerName)
  if not player then
    return outputChatBox ( "ვერ მოიძებნა", thePlayer, 255, 0, 0 );
  end

  triggerClientEvent ( "showBSODToPlayer", player, player)
end)