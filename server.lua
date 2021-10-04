data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:cigar")
AddEventHandler("RegisterUsableItem:cigar", function(source)
	local ItemData = data.getItem(source, 'cigar')
	ItemData.RemoveItem(1)
	TriggerClientEvent('kzn_smoking:cigar', source)
end)

RegisterServerEvent("RegisterUsableItem:cigarette")
AddEventHandler("RegisterUsableItem:cigarette", function(source)
	local ItemData = data.getItem(source, 'cigarette')
	ItemData.RemoveItem(1)
	TriggerClientEvent('kzn_smoking:cigarette', source)
end)

RegisterServerEvent("RegisterUsableItem:pipe")
AddEventHandler("RegisterUsableItem:pipe", function(source)
	local ItemData = data.getItem(source, 'pipe')
	TriggerClientEvent('kzn_smoking:pipe', source)
end)

RegisterServerEvent("RegisterUsableItem:joint")
AddEventHandler("RegisterUsableItem:joint", function(source)
	local ItemData = data.getItem(source, 'joint')
	ItemData.RemoveItem(1)
	TriggerClientEvent('kzn_smoking:joint', source)
end)

RegisterServerEvent("RegisterUsableItem:opium")
AddEventHandler("RegisterUsableItem:opium", function(source)
	local ItemData = data.getItem(source, 'opium')
	ItemData.RemoveItem(1)
	TriggerClientEvent('kzn_smoking:opium', source)
end)