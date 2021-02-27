
ESX = nil
ModelDemande = nil

-- Reception du model rechercher par simeon donné par le serveur
RegisterNetEvent('Simeon:RetourDemandeVehicule')
AddEventHandler('Simeon:RetourDemandeVehicule', function(Model) ModelDemande = Model end)





-- Thread
Citizen.CreateThread(function()

	-- Systeme ESX
	while ESX == nil do 
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
		Citizen.Wait(100)
	end

	-- Demande du model au serveur
	while ModelDemande == nil do 
		TriggerServerEvent('Simeon:DemanderVehicule')
		Citizen.Wait(100) 
	end

	-- Spawn de Simeon
	Simeon()

	-- Parler a Simeon ou vendre la voiture 
    while true do Wait(10)
        local coords = GetEntityCoords(GetPlayerPed(-1))

		
        if GetDistanceBetweenCoords(coords, Config.Revente.x, Config.Revente.y, Config.Revente.z, true) < 2.0 and IsPedInAnyVehicle(PlayerPedId(), false) then
			ESX.ShowHelpNotification('~INPUT_CONTEXT~ Livrer un Vehicule a Simeon')
            if PresseE() and CheckVehicule() then VendreVehiculeSimeon() end

		elseif GetDistanceBetweenCoords(coords, Config.Simeon.x, Config.Simeon.y, Config.Simeon.z, true) < 1.5 then 
			ESX.ShowHelpNotification('~INPUT_CONTEXT~ Parler avec Simeon')
			if PresseE() then ParlerASimeon() end 
		end

    end
end)





-- Verifie que le vehicule soit le bon et/ou en bonne etat
function CheckVehicule()

	local Veh = GetVehiclePedIsIn(PlayerPedId())

	if not IsPedInAnyVehicle(PlayerPedId(), false) then return false end

	if ModelDemande == nil then return false end
	if GetEntityModel(Veh) == GetHashKey(Config.Liste[ModelDemande].model) then
		
		if GetVehicleEngineHealth(Veh) >= Config.MaxCasse then return true
		else Notif('Qu\'est ce que je pourrait faire avec ton tas de feraille ?') end

	else 
		local ModelName = Config.Liste[ModelDemande].label
		Notif('Ca ressemble a ce que je t\'ai demandé ?~n~Je veut une '.. ModelName) 
	end

	return false

end





-- Vend le vehicule à Simeon, paye et demande un nouveau
function VendreVehiculeSimeon()
	
	local Veh = GetVehiclePedIsIn(PlayerPedId())
	SetEntityAsMissionEntity(Veh, true, true)
	DeleteVehicle(Veh) 

	TriggerServerEvent('Simeon:Payer', Config.Liste[ModelDemande].prix)
	Notif('Merci bien, prend ton fric et reviens plus tard et ont verras si j\'ai du travail pour toi')
	Wait(1000)

end





-- Demander a Simeon quel vehicule il cherche
function ParlerASimeon()
	if ModelDemande == nil then 
		Notif('Mes clients ne cherche rien pour l\'instant, reviens plus tard et ont verras si j\'ai du travail pour toi')
		return false
	end
	local ModelName = Config.Liste[ModelDemande].label
	Notif('Mes clients cherchent des '..ModelName..'. Je te paye '.. Config.Liste[ModelDemande].prix ..'$')
end





-- Verifie que la touche E soit utilisée
function PresseE()
	if IsControlJustPressed(0, 38) or IsControlJustReleased(0, 38) then return true
	else return false end
end





-- Notifie avec la gueule de Simeon
function Notif(Notif)
	ESX.ShowAdvancedNotification('[ Simeon ]', nil , Notif , 'CHAR_SIMEON', 0)
end





-- Fait spawn le gros batard
function Simeon()
	RequestModel(GetHashKey('cs_siemonyetarian'))
	while not HasModelLoaded(GetHashKey('cs_siemonyetarian')) do Wait(50) end

	local Peds = CreatePed(4, GetHashKey('cs_siemonyetarian'), Config.Simeon.x, Config.Simeon.y, Config.Simeon.z, Config.Simeon.h, false, false)
	SetPedCanBeTargettedByPlayer(Peds, false)
	SetEntityInvincible(Peds, true)
	SetBlockingOfNonTemporaryEvents(Peds, true)
	FreezeEntityPosition(Peds, true)
	SetPedFleeAttributes(Peds, 0, 0)
	SetPedArmour(Peds, 20000)
	SetPedMaxHealth(Peds, 20000)
	SetPedDiesWhenInjured(Peds, false)
	TaskStartScenarioInPlace(Peds, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, 0)

	SetModelAsNoLongerNeeded(GetHashKey('cs_siemonyetarian'))


end

