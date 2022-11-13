ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
math.randomseed(os.time())

ESX.RegisterServerCallback("crewPhone:getAccessToken",function(a,b)
    b(________)
end)

RegisterServerEvent("nwx:createTwitter")
AddEventHandler("nwx:createTwitter", function(identifier)
    local _source = source
    local sourcePlayer = tonumber(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)

    while xPlayer == nil do
        xPlayer = ESX.GetPlayerFromId(_source)
        Citizen.Wait(2500)
    end

    local identifier = xPlayer.identifier
    getUserTwitterAccount(sourcePlayer, identifier)
end)

RegisterServerEvent("crew:onPlayerLoaded")
AddEventHandler("crew:onPlayerLoaded", function(identifier)
    local _source = source
    local sourcePlayer = tonumber(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    while xPlayer == nil do
        xPlayer = ESX.GetPlayerFromId(_source)
        Citizen.Wait(2500)
    end
    local identifier = xPlayer.identifier
    local num = getNumberPhone(identifier)

	Citizen.Wait(500)

    getOrGeneratePhoneNumber(sourcePlayer, identifier, function(num)
        TriggerClientEvent("crew:updatePhone", sourcePlayer, num, getContacts(identifier), getMessages(identifier))
        sendHistoriqueCall(sourcePlayer, num)
    end)

    getBankUpdatePhone(sourcePlayer)
end)

function getNumberPhone(identifier)
    local result = MySQL.Sync.fetchAll("SELECT users.phone_number FROM users WHERE users.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].phone_number
    end
    return nil
end

function getBankUpdatePhone(source, xPlayer, BankName)
    local _source = source
    local identifier = _identifier
    local xPlayer = ESX.GetPlayerFromId(_source)
    local BankName = xPlayer.getName()

    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    }, function(result2)
        local user = result2[1]

        if user == nil then
            TriggerClientEvent('crew:getPlayerBank', _source, xPlayer, BankName)
        else
            --local FirstLastName = user['firstname'] .. ' ' .. user['lastname']
            TriggerClientEvent('crew:getPlayerBank', _source, xPlayer, BankName)
        end
    end)
end

MySQL.ready(function ()
    MySQL.Async.execute('DELETE FROM phone_messages WHERE transmitter = \'police\'')
    MySQL.Async.execute('DELETE FROM phone_messages WHERE transmitter = \'ambulance\'')
    MySQL.Async.execute('DELETE FROM phone_messages WHERE transmitter = \'news\'')
end)

--- Phone Number Style Config.lua FourDigit = true then generate 4 number else generate ####### number
function getPhoneRandomNumber()
    local numBase0 = '555'
    local numBase1 = math.random(0000,9999)
    local num = string.format("%03d-%04d", numBase0, numBase1)

    return num
end

--====================================================================================
--  Utils
--====================================================================================
function getSourceFromIdentifier(identifier, cb)
    local xPlayers = ESX.GetPlayers()
    
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        
        if(xPlayer.identifier ~= nil and xPlayer.identifier == identifier) or (xPlayer.identifier == identifier) then
            cb(xPlayer.source)
            return
        end
    end
    cb(nil)
end

function getIdentifierByPhoneNumber(phone_number) 
    local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number = @phone_number", {
        ['@phone_number'] = phone_number
    })
    if result[1] ~= nil then
        return result[1].identifier
    end
    return nil
end

function getIdentifier2ByPhoneNumber(phone_number) 
    local result = MySQL.Sync.fetchAll("SELECT sim.identifier FROM sim WHERE sim.phone_number = @phone_number", {
        ['@phone_number'] = phone_number
    })
    if result[1] ~= nil then
        return result[1].identifier
    end
    return nil
end

function getUserTwitterAccount(source, _identifier)
    local _source = source
    local identifier = _identifier
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
        ['@identifier'] = identifier
    }, function(result2)
        local user = result2[1]

        if user == nil then 
            --karakteribekle(xPlayer.source, identifier)
            karakteribekle(xPlayer, identifier)
        else
            local FirstLastName = user['firstname'] .. ' ' .. user['lastname']
            
            TriggerClientEvent('crew:getPlayerBank', _source, xPlayer, FirstLastName)

            MySQL.Async.fetchScalar("SELECT identifier FROM twitter_accounts WHERE identifier = @identifier", {
                ['@identifier'] = identifier
            }, function(result)
                if result ~= nil then
                    TriggerEvent('gcPhone:twitter_login', _source, result)
                else
                    MySQL.Async.fetchAll("INSERT INTO twitter_accounts (identifier, username) VALUES (@identifier, @username)", { 
                        ['@identifier'] = identifier,
                        ['@username'] = FirstLastName
                    }, function()
                        TriggerEvent('gcPhone:twitter_login', _source, identifier)
                    end)
                end
            end)
        end
    end)
end


function karakteribekle(source, identifier)
    Citizen.Wait(60000)
    local _source = source
    local xidentifier = identifier
    getUserTwitterAccount(_source, xidentifier)
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function getOrGeneratePhoneNumber (sourcePlayer, identifier, cb)
    local sourcePlayer = sourcePlayer
    local identifier = identifier
    local myPhoneNumber = getNumberPhone(identifier)
    Citizen.Wait(500)
    if myPhoneNumber == '0' or myPhoneNumber == nil or myPhoneNumber == '' then
        repeat
            myPhoneNumber = getPhoneRandomNumber()
            local id = getIdentifierByPhoneNumber(myPhoneNumber)
        until id == nil
        MySQL.Async.insert("UPDATE users SET phone_number = @myPhoneNumber WHERE identifier = @identifier", { 
            ['@myPhoneNumber'] = myPhoneNumber,
            ['@identifier'] = identifier
        }, function ()
            cb(myPhoneNumber)
        end)
    else
        cb(myPhoneNumber)
    end
end

--====================================================================================
--  Contacts
--====================================================================================
function getContacts(identifier)
    --local result = MySQL.Sync.fetchAll("SELECT phone_users_contacts.* FROM phone_users_contacts WHERE phone_users_contacts.identifier = @identifier", {
    --    ['@identifier'] = identifier
    --})
    --return result
    local result = MySQL.Sync.fetchAll("SELECT phone_users_contacts.*, users.phone_number FROM phone_users_contacts LEFT JOIN users ON users.identifier = @identifier WHERE phone_users_contacts.mynumero = users.phone_number", {
        ['@identifier'] = identifier
    })
    return result
end

function addContact(source, identifier, number, display)
    local sourcePlayer = tonumber(source)
    local myPhone = getNumberPhone(identifier)
    MySQL.Async.insert("INSERT INTO phone_users_contacts (`identifier`, `mynumero`, `number`,`display`) VALUES(@identifier, @mynumero, @number, @display)", {
        ['@identifier'] = identifier,
        ['@mynumero'] = myPhone,
        ['@number'] = number,
        ['@display'] = display,
    },function()
        notifyContactChange(sourcePlayer, identifier)
    end)
end

function updateContact(source, identifier, id, number, display)
    local sourcePlayer = tonumber(source)
    MySQL.Async.insert("UPDATE phone_users_contacts SET number = @number, display = @display WHERE id = @id", { 
        ['@number'] = number,
        ['@display'] = display,
        ['@id'] = id,
    },function()
        notifyContactChange(sourcePlayer, identifier)
    end)
end

function deleteContact(source, identifier, id)
    local sourcePlayer = tonumber(source)
    MySQL.Sync.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier AND `id` = @id", {
        ['@identifier'] = identifier,
        ['@id'] = id,
    })
    notifyContactChange(sourcePlayer, identifier)
end

function deleteAllContact(identifier)
    MySQL.Sync.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier", {
        ['@identifier'] = identifier
    })
end

function notifyContactChange(source, identifier)
    local sourcePlayer = tonumber(source)
    local identifier = identifier
    if sourcePlayer ~= nil then 
        TriggerClientEvent("gcPhone:contactList", sourcePlayer, getContacts(identifier))
    end
end

ESX.RegisterServerCallback('crew-phone:phone-check', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return; end
    for k, v in pairs(Config.Phones) do
        local items = xPlayer.getInventoryItem(v)
        if items.count > 0 then
            cb(v)
            return
        end
	end
    cb(nil)
end)

ESX.RegisterServerCallback('crew-phone:item-check', function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return; end
    local items = xPlayer.getInventoryItem(data)
    cb(items.count)
end)

RegisterServerEvent('gcPhone:addContact')
AddEventHandler('gcPhone:addContact', function(display, phoneNumber)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    addContact(sourcePlayer, identifier, phoneNumber, display)
end)

RegisterServerEvent('gcPhone:updateContact')
AddEventHandler('gcPhone:updateContact', function(id, display, phoneNumber)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    updateContact(sourcePlayer, identifier, id, phoneNumber, display)
end)

RegisterServerEvent('gcPhone:deleteContact')
AddEventHandler('gcPhone:deleteContact', function(id)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    deleteContact(sourcePlayer, identifier, id)
end)

--====================================================================================
--  Messages
--====================================================================================
function getMessages(identifier)
    local result = MySQL.Sync.fetchAll("SELECT phone_messages.*, users.phone_number FROM phone_messages LEFT JOIN users ON users.identifier = @identifier WHERE phone_messages.receiver = users.phone_number", {
         ['@identifier'] = identifier
    })
    return result
end

RegisterServerEvent('gcPhone:_internalAddMessage')
AddEventHandler('gcPhone:_internalAddMessage', function(transmitter, receiver, message, owner, cb)
    cb(_internalAddMessage(transmitter, receiver, message, owner))
end)

function _internalAddMessage(transmitter, receiver, message, owner)
    MySQL.Async.insert("INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner)", {
        ['@transmitter'] = transmitter,
        ['@receiver'] = receiver,
        ['@message'] = message,
        ['@isRead'] = owner,
        ['@owner'] = owner
    })
    
    local data = {message = message, time = tonumber(os.time().."000.0"), receiver = receiver, transmitter = transmitter, owner = owner, isRead = owner}
    return data
end

function addMessage(source, identifier, phone_number, message)
    local sourcePlayer = tonumber(source)
    local otherIdentifier = getIdentifierByPhoneNumber(phone_number)
    local myPhone = getNumberPhone(identifier)
    TriggerEvent('MyCity_Core:SMS:Logs', myPhone .. ' -> ' .. phone_number, message)
    if otherIdentifier == nil then 
        otherIdentifier = getIdentifier2ByPhoneNumber(phone_number)
        local tomess = _internalAddMessage(myPhone, phone_number, message, 0)
        getSourceFromIdentifier(otherIdentifier, function (osou)
            if tonumber(osou) ~= nil then
                local result = MySQL.Sync.fetchAll("SELECT sim.name FROM sim WHERE sim.phone_number = @phone_number", {
                    ['@phone_number'] = phone_number
                })
                if result[1] ~= nil then
                    TriggerClientEvent("esx:showNotification", tonumber(osou), "Vous avez recu un message sur la carte ~g~" .. result[1].name .. ' - ' .. phone_number)
                end
                
            end
        end) 
    else
        local tomess = _internalAddMessage(myPhone, phone_number, message, 0)
        getSourceFromIdentifier(otherIdentifier, function (osou)
            if tonumber(osou) ~= nil then 
                TriggerClientEvent("gcPhone:receiveMessage", tonumber(osou), tomess)
            end
        end) 
    end
    local memess = _internalAddMessage(phone_number, myPhone, message, 1)
    TriggerClientEvent("gcPhone:receiveMessage", sourcePlayer, memess)
end

function setReadMessageNumber(identifier, num)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Async.execute("UPDATE phone_messages SET phone_messages.isRead = 1 WHERE phone_messages.receiver = @receiver AND phone_messages.transmitter = @transmitter", { 
        ['@receiver'] = mePhoneNumber,
        ['@transmitter'] = num
    })
end

function deleteMessage(msgId)
    MySQL.Async.execute("DELETE FROM phone_messages WHERE `id` = @id", {
        ['@id'] = msgId
    })
end

function deleteAllMessageFromPhoneNumber(source, identifier, phone_number)
    local source = source
    local identifier = identifier
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Async.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber and `transmitter` = @phone_number", {
        ['@mePhoneNumber'] = mePhoneNumber,['@phone_number'] = phone_number
    })
end

function deleteAllMessage(identifier)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Async.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber", {
        ['@mePhoneNumber'] = mePhoneNumber
    })
end

RegisterServerEvent('gcPhone:sendMessage')
AddEventHandler('gcPhone:sendMessage', function(phoneNumber, message)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    print(phoneNumber)
    addMessage(sourcePlayer, identifier, phoneNumber, message)
end)

RegisterServerEvent('gcPhone:deleteMessage')
AddEventHandler('gcPhone:deleteMessage', function(msgId)
    deleteMessage(msgId)
end)

RegisterServerEvent('gcPhone:deleteMessageNumber')
AddEventHandler('gcPhone:deleteMessageNumber', function(number)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    deleteAllMessageFromPhoneNumber(sourcePlayer,identifier, number)
end)

RegisterServerEvent('gcPhone:deleteAllMessage')
AddEventHandler('gcPhone:deleteAllMessage', function()
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    deleteAllMessage(identifier)
end)

RegisterServerEvent('gcPhone:setReadMessageNumber')
AddEventHandler('gcPhone:setReadMessageNumber', function(num)
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    setReadMessageNumber(identifier, num)
end)

RegisterServerEvent('gcPhone:deleteALL')
AddEventHandler('gcPhone:deleteALL', function()
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    deleteAllMessage(identifier)
    deleteAllContact(identifier)
    appelsDeleteAllHistorique(identifier)
    TriggerClientEvent("gcPhone:contactList", sourcePlayer, {})
    TriggerClientEvent("gcPhone:allMessage", sourcePlayer, {})
    TriggerClientEvent("appelsDeleteAllHistorique", sourcePlayer, {})
end)

--====================================================================================
--  Gestion des appels
--====================================================================================
local AppelsEnCours = {}
local PhoneFixeInfo = {}
local lastIndexCall = 10

function getHistoriqueCall(num)
    local result = MySQL.Sync.fetchAll("SELECT * FROM phone_calls WHERE phone_calls.owner = @num ORDER BY time DESC LIMIT 30", {
        ['@num'] = num
    })
    return result
end

function sendHistoriqueCall(src, num) 
    local histo = getHistoriqueCall(num)
    TriggerClientEvent('gcPhone:historiqueCall', src, histo)
end

function saveAppels (appelInfo)
    if appelInfo.extraData == nil or appelInfo.extraData.useNumber == nil then
        MySQL.Async.insert("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
            ['@owner'] = appelInfo.transmitter_num,
            ['@num'] = appelInfo.receiver_num,
            ['@incoming'] = 1,
            ['@accepts'] = appelInfo.is_accepts
        }, function()
            notifyNewAppelsHisto(appelInfo.transmitter_src, appelInfo.transmitter_num)
        end)
    end
    if appelInfo.is_valid == true then
        local num = appelInfo.transmitter_num
        if appelInfo.hidden == true then
            mun = "#######"
        end
        MySQL.Async.insert("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
            ['@owner'] = appelInfo.receiver_num,
            ['@num'] = num,
            ['@incoming'] = 0,
            ['@accepts'] = appelInfo.is_accepts
        }, function()
            if appelInfo.receiver_src ~= nil then
                notifyNewAppelsHisto(appelInfo.receiver_src, appelInfo.receiver_num)
            end
        end)
    end
end

function notifyNewAppelsHisto (src, num) 
    sendHistoriqueCall(src, num)
end

RegisterServerEvent('gcPhone:getHistoriqueCall')
AddEventHandler('gcPhone:getHistoriqueCall', function()
    local _source = source
    local sourcePlayer = tonumber(_source)
    xPlayer = ESX.GetPlayerFromId(_source)
    identifier = xPlayer.identifier
    local srcPhone = getNumberPhone(identifier)
    sendHistoriqueCall(sourcePlayer, num)
end)

RegisterServerEvent('gcPhone:internal_startCall')
AddEventHandler('gcPhone:internal_startCall', function(source, phone_number, rtcOffer, extraData)
    if FixePhone[phone_number] ~= nil then
        onCallFixePhone(source, phone_number, rtcOffer, extraData)
        return
    end
    
    local rtcOffer = rtcOffer
    if phone_number == nil or phone_number == '' then 
        print('BAD CALL NUMBER IS NIL')
        return
    end

    local hidden = string.sub(phone_number, 1, 1) == '#'
    if hidden == true then
        phone_number = string.sub(phone_number, 2)
    end

    local indexCall = lastIndexCall
    lastIndexCall = lastIndexCall + 1

    local sourcePlayer = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    local srcPhone = ''
    if extraData ~= nil and extraData.useNumber ~= nil then
        srcPhone = extraData.useNumber
    else
        srcPhone = getNumberPhone(identifier)
    end
    local destPlayer = getIdentifierByPhoneNumber(phone_number)
    local is_valid = destPlayer ~= nil and destPlayer ~= identifier
    AppelsEnCours[indexCall] = {
        id = indexCall,
        transmitter_src = sourcePlayer,
        transmitter_num = srcPhone,
        receiver_src = nil,
        receiver_num = phone_number,
        is_valid = destPlayer ~= nil,
        is_accepts = false,
        hidden = hidden,
        rtcOffer = rtcOffer,
        extraData = extraData
    }
    
    if is_valid == true then
        getSourceFromIdentifier(destPlayer, function (srcTo)
            if srcTo ~= nil then
                AppelsEnCours[indexCall].receiver_src = srcTo
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
                TriggerClientEvent('gcPhone:waitingCall', srcTo, AppelsEnCours[indexCall], false) -- karşı oyuncuyu arama
                TriggerClientEvent('gcPhone:TgiannSes', -1, srcTo)
            else
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
            end
        end)
    else
        TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
    end
end)

RegisterServerEvent('gcPhone:startCall')
AddEventHandler('gcPhone:startCall', function(phone_number, rtcOffer, extraData)
    TriggerEvent('gcPhone:internal_startCall', source, phone_number, rtcOffer, extraData)
end)

RegisterServerEvent('gcPhone:candidates')
AddEventHandler('gcPhone:candidates', function (callId, candidates)
    if AppelsEnCours[callId] ~= nil then
        local source = source
        local to = AppelsEnCours[callId].transmitter_src
        if source == to then 
            to = AppelsEnCours[callId].receiver_src
        end
        TriggerClientEvent('gcPhone:candidates', to, candidates)
    end
end)
--[[
RegisterServerEvent('gcPhone:acceptCall')
AddEventHandler('gcPhone:acceptCall', function(infoCall, rtcAnswer)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if PhoneFixeInfo[id] ~= nil then
            onAcceptFixePhone(source, infoCall, rtcAnswer)
            return
        end
        AppelsEnCours[id].receiver_src = infoCall.receiver_src or AppelsEnCours[id].receiver_src
        if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src ~= nil then
            AppelsEnCours[id].is_accepts = true
            AppelsEnCours[id].rtcAnswer = rtcAnswer
            TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id], true)
            SetTimeout(1000, function()
                if AppelsEnCours[id].receiver_src ~= nil and AppelsEnCours[id] ~= nil then
                    TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id], false)
                end
            end)
            TriggerClientEvent("gcPhone:stop-call-sound", -1, AppelsEnCours[id].receiver_src)
            saveAppels(AppelsEnCours[id])
        end
    end
end)]]

RegisterServerEvent('gcPhone:acceptCall')
AddEventHandler('gcPhone:acceptCall', function(infoCall, rtcAnswer)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if PhoneFixeInfo[id] ~= nil then
            onAcceptFixePhone(source, infoCall, rtcAnswer)
            return
        end
        AppelsEnCours[id].receiver_src = infoCall.receiver_src or AppelsEnCours[id].receiver_src
        if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src ~= nil then
            AppelsEnCours[id].is_accepts = true
            AppelsEnCours[id].rtcAnswer = rtcAnswer
            TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id], true)
            TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id], false)
            exports.saltychat:EstablishCall(AppelsEnCours[id].transmitter_src, AppelsEnCours[id].receiver_src)
            saveAppels(AppelsEnCours[id])
        end
    end
end)

RegisterServerEvent('gcPhone:rejectCall')
AddEventHandler('gcPhone:rejectCall', function (infoCall)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if PhoneFixeInfo[id] ~= nil then
            onRejectFixePhone(source, infoCall)
            return
        end
        if AppelsEnCours[id].transmitter_src ~= nil then
            TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].transmitter_src)
        end
        if AppelsEnCours[id].receiver_src ~= nil then
            TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].receiver_src)
        end

        if AppelsEnCours[id].is_accepts == false then 
            saveAppels(AppelsEnCours[id])
        end
        TriggerEvent('gcPhone:removeCall', AppelsEnCours)
        exports.saltychat:EndCall(AppelsEnCours[id].transmitter_src, AppelsEnCours[id].receiver_src)
        AppelsEnCours[id] = nil
    end
end)

RegisterServerEvent('gcPhone:appelsDeleteHistorique')
AddEventHandler('gcPhone:appelsDeleteHistorique', function (numero)
    local _source = source
    local sourcePlayer = tonumber(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    local srcPhone = getNumberPhone(identifier)
    MySQL.Async.execute("DELETE FROM phone_calls WHERE `owner` = @owner AND `num` = @num", {
        ['@owner'] = srcPhone,
        ['@num'] = numero
    })
end)

function appelsDeleteAllHistorique(srcIdentifier)
    local srcPhone = getNumberPhone(srcIdentifier)
    MySQL.Async.execute("DELETE FROM phone_calls WHERE `owner` = @owner", {
        ['@owner'] = srcPhone
    })
end

RegisterServerEvent('gcPhone:appelsDeleteAllHistorique')
AddEventHandler('gcPhone:appelsDeleteAllHistorique', function ()
    local _source = source
    local sourcePlayer = tonumber(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.identifier
    appelsDeleteAllHistorique(identifier)
end)



--====================================================================================
--  OnLoad
--====================================================================================

RegisterCommand('telfix', function(source)
    TriggerEvent('crew:onPlayerLoaded', source) 
end)


function onCallFixePhone (source, phone_number, rtcOffer, extraData)
    local indexCall = lastIndexCall
    lastIndexCall = lastIndexCall + 1

    local hidden = string.sub(phone_number, 1, 1) == '#'
    if hidden == true then
        phone_number = string.sub(phone_number, 2)
    end
    local sourcePlayer = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    local srcPhone = ''
    if extraData ~= nil and extraData.useNumber ~= nil then
        srcPhone = extraData.useNumber
    else
        srcPhone = getNumberPhone(identifier)
    end

    AppelsEnCours[indexCall] = {
        id = indexCall,
        transmitter_src = sourcePlayer,
        transmitter_num = srcPhone,
        receiver_src = nil,
        receiver_num = phone_number,
        is_valid = false,
        is_accepts = false,
        hidden = hidden,
        rtcOffer = rtcOffer,
        extraData = extraData,
        coords = FixePhone[phone_number].coords
    }
    
    PhoneFixeInfo[indexCall] = AppelsEnCours[indexCall]

    TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
    TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
end



function onAcceptFixePhone(source, infoCall, rtcAnswer)
    local id = infoCall.id
    
    AppelsEnCours[id].receiver_src = source
    if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src~= nil then
        AppelsEnCours[id].is_accepts = true
        AppelsEnCours[id].forceSaveAfter = true
        AppelsEnCours[id].rtcAnswer = rtcAnswer
        PhoneFixeInfo[id] = nil
        TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
        TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id], true)
	SetTimeout(1000, function() -- change to +1000, if necessary.
       		TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id], false)
	end)
        saveAppels(AppelsEnCours[id])
    end
end

function onRejectFixePhone(source, infoCall, rtcAnswer)
    local id = infoCall.id
    PhoneFixeInfo[id] = nil
    TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
    TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].transmitter_src)
    if AppelsEnCours[id].is_accepts == false then
        saveAppels(AppelsEnCours[id])
    end
    AppelsEnCours[id] = nil
    
end
