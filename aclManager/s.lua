addCommandHandler('setrole', function(thePlayer, command, account, group)
    if not account or not group then
        return outputChatBox('ბრძანების სინტაქსი: /' .. command .. ' ანგარიში ჯგუფი', thePlayer, 255, 255, 255)
    end

    local accObj = getAccount(account)

    if not accObj then
        return outputChatBox('ანგარიში არ არსებობს', thePlayer, 255, 255, 255)
    end

    local grpObj = aclGetGroup(group)

    if not grpObj then
        return outputChatBox('ACL ჯგუფი არ არსებობს', thePlayer, 255, 255, 255)
    end

    local objStr = 'user.' .. account

    local groups = aclGroupList()

    for _, g in pairs(groups) do 
        aclGroupRemoveObject(g, objStr)
    end

    if group == 'Everyone' then
        return outputChatBox('ეგაა', thePlayer, 255, 255, 255)
    end

    aclGroupAddObject(grpObj, objStr)

    outputChatBox('ანგარიში წარმატებით დაემატა ჯგუფში ' .. group, thePlayer, 255, 255, 255)
end)