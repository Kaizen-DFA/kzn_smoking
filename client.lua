RegisterNetEvent("kzn_smoking:cigar")
AddEventHandler("kzn_smoking:cigar", function()
    TaskStartScenarioInPlace(GetPlayerPed(), GetHashKey('WORLD_HUMAN_SMOKE_CIGAR'), 45000, true, false, false, false)
    Citizen.Wait(45500)
    ClearPedTasksImmediately(PlayerPedId())
    end)

RegisterNetEvent("kzn_smoking:cigarette")
AddEventHandler("kzn_smoking:cigarette", function()
    TaskStartScenarioInPlace(GetPlayerPed(), GetHashKey('WORLD_HUMAN_SMOKE_INTERACTION'), 45000, true, false, false, false)
    Citizen.Wait(45500)
    ClearPedTasksImmediately(PlayerPedId())
    end)

RegisterNetEvent("kzn_smoking:pipe")
AddEventHandler("kzn_smoking:pipe", function()
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local pipe = CreateObject(GetHashKey('P_PIPE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(PlayerPedId(), "SKEL_R_Finger13")
    RequestAnimDict("amb_wander@code_human_smoking_wander@male_b@trans")
    while not HasAnimDictLoaded("amb_wander@code_human_smoking_wander@male_b@trans") do
    Citizen.Wait(100)
    end
    AttachEntityToEntity(pipe, PlayerPedId(), righthand, 0.005, -0.045, 0.0, -170.0, 10.0, -15.0, true, true, false, true, 1, true)
    TaskPlayAnim(PlayerPedId(), "amb_wander@code_human_smoking_wander@male_b@trans", "nopipe_trans_pipe", 8.0, 8.0, 7500, 31, 0, true, 0, false, 0, false)
    Citizen.Wait(7550)
    RequestAnimDict("amb_rest@world_human_smoking@male_b@base")
    TaskPlayAnim(PlayerPedId(), "amb_rest@world_human_smoking@male_b@base", "base", 8.0, 8.0, 7500, 31, 0, true, 0, false, 0, false)
    Citizen.Wait(8000)
    DetachEntity(pipe, true, true)
end)

RegisterNetEvent("kzn_smoking:joint")
AddEventHandler("kzn_smoking:joint", function()
    TaskStartScenarioInPlace(GetPlayerPed(), GetHashKey('WORLD_HUMAN_SMOKE_INTERACTION'), 45000, true, false, false, false)
    Citizen.Wait(45500)
    AnimpostfxPlay("PlayerDrugsPoisonWell")
    Wait(60000)
	AnimpostfxStop("PlayerDrugsPoisonWell")
    ClearPedTasksImmediately(PlayerPedId())
    end)

RegisterNetEvent("kzn_smoking:opium")
AddEventHandler("kzn_smoking:opium", function()
    TaskStartScenarioInPlace(GetPlayerPed(), GetHashKey('WORLD_HUMAN_SMOKE_INTERACTION'), 45000, true, false, false, false)
    Citizen.Wait(45500)
    AnimpostfxPlay("PlayerDrunkAberdeen")
    Wait(60000)
    AnimpostfxStop("PlayerDrunkAberdeen")
    ClearPedTasksImmediately(PlayerPedId())
    end)

--Cancel Scenario (Mouse 2 / Right Click) change to your needs!
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 0xF84FA74F) then
            ClearPedTasksImmediately(PlayerPedId())
        end
    end 
end)
