local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)

        local player = PlayerPedId()
        local weapon = GetSelectedPedWeapon(player)
        local weaponData = QBCore.Shared.Weapons[weapon]
        local weaponName = weaponData and weaponData.label or 'Unarmed'
        local weaponHash = weaponData and weaponData.name or 'unarmed'

        local ammoInWeapon = 0
 
        if weaponData then
            if weaponData.name ~= 'WEAPON_UNARMED' then
                ammoTotal = GetPedAmmoByType(player, GetHashKey(weaponData.ammotype))
                _, ammoInWeapon = GetAmmoInClip(player, weapon)
                
            end
        end

        SendNUIMessage({
            weapon = weaponName,
            weaponHash = weaponHash,
            ammo = ammoInWeapon,
            ammoTotal = ammoTotal
        })
    end
end)
