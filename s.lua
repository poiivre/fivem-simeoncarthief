
ESX  = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ModelDemande = nil

function ChoixVehicule() 

  ModelDemande = math.random(1, Config.ListeMax) 
  TriggerClientEvent('Simeon:RetourDemandeVehicule', -1, ModelDemande )
  print('Simeon : Choix vehicule : '..Config.Liste[ModelDemande].model )
  SetTimeout(Config.TempsRecherche, ChoixVehicule)

end
ChoixVehicule()




function PauseVehicule() 

  ModelDemande = nil
  TriggerClientEvent('Simeon:RetourDemandeVehicule', -1, ModelDemande )

  Wait(Config.TempsEntre)
  ChoixVehicule()

end



RegisterServerEvent('Simeon:Payer')
AddEventHandler('Simeon:Payer', function(nombre)

	local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addMoney(nombre)
  PauseVehicule()

end)



RegisterServerEvent('Simeon:DemanderVehicule')
AddEventHandler('Simeon:DemanderVehicule', function()

  TriggerClientEvent('Simeon:RetourDemandeVehicule', source, ModelDemande )

end)

