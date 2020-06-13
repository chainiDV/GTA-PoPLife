Citizen.CreateThread(function()
	while true do
		local Player = GetPlayerPed(-1)
		SetExplosiveAmmoThisFrame(Player, 0)
		SetExplosiveMeleeThisFrame(Player, 0)
		SetFireAmmoThisFrame(Player, 0)			 
		Citizen.Wait(0)
	end
end)

