
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('pedidoarmas', function(source, rawCommand)

	TriggerClientEvent("tostweapon:AccesGranted",source)
	Wait(200)
	
end)

RegisterServerEvent("tostweapon:buyWeapon")
AddEventHandler("tostweapon:buyWeapon", function(hash,cena,nazwa)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local BlackHajs = 0
	BlackHajs = xPlayer.getAccount('money').money
	
	if BlackHajs >= cena then
	xPlayer.removeAccountMoney('money', cena)
	TriggerClientEvent('esx:showNotification', _source, 'Pagaste al traficante'..cena..'$usd por '..nazwa)
	TriggerClientEvent("tostweapon:ZakupionoDaj", _source, hash)
	else
	TriggerClientEvent('esx:showNotification', _source, '¡No tienes el dinero suficiente para comprar armas, no hagas perder el tiempo al traficante!'..cena..'$')
	end
	
end)