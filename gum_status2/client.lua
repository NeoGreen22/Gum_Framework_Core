local hud = false
local compass = false
local voiceVolume = 25
local voiceOn = false

local YouNeedMinimap = false

local map = true
local mapRadar = false
local compat = true

local hud1 = true

TriggerEvent("gum_menu:getData",function(call)
    MenuData = call
end)

RegisterCommand("hud", function(source, args, rawCommand)
	if hud == true then
        hud = false
	else
        hud = true
	end
end)

RegisterCommand("prog_test", function(source, args, rawCommand)
    exports.gum_status2:DisplayProgressBar(15000)
end)
exports('DisplayProgressBar', function(time)
    local timer = (time / 100)
    local DisplayElemet = 0
    while DisplayElemet < 100 do
        SendNUIMessage({progress=true, time=DisplayElemet})
        DisplayElemet = DisplayElemet + 1
        Wait(timer)
        if DisplayElemet > 99 then
            SendNUIMessage({progress=false})
        end
    end
end)


RegisterNetEvent('gum_status:enable_compass')
AddEventHandler('gum_status:enable_compass', function()
    if compass == false then
        compass = true
    else
        compass = false
    end
end)

RegisterNetEvent("gum:SelectedCharacter")
AddEventHandler("gum:SelectedCharacter", function(charid)
    Citizen.CreateThread(function()
        hud = true
     end)
end)

RegisterNetEvent('gum_status:voiceOn')
AddEventHandler('gum_status:voiceOn', function()
    if voiceOn == false then
        voiceOn = true
    else
        voiceOn = false
    end
end)

RegisterNetEvent('gum_status:range')
AddEventHandler('gum_status:range', function(range)
    if tonumber(range) == 30 then
        voiceVolume = 100
    elseif tonumber(range) == 15 then
        voiceVolume = 75
    elseif tonumber(range) == 8 then
        voiceVolume = 50
    elseif tonumber(range) == 3.5 then
        voiceVolume = 25
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if compass == true then
            local ped = PlayerPedId()
            local h = GetEntityHeading(PlayerPedId())        
            h = h + GetGameplayCamRelativeHeading()
            SendNUIMessage({compass=true, angle=h})
        else
            SendNUIMessage({compass=false})
        end
        
        Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_INFINITE_AMMO"))
        if YouNeedMinimap == false and Config.Hudchange == false then
            Citizen.InvokeNative(0x4CC5F2FC1332577F, GetHashKey("HUD_CTX_SHARP_SHOOTER_EVENT"))
            Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_RESTING_BY_FIRE"))
            Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_INFO_CARD"))
        end
        Citizen.InvokeNative(0x4CC5F2FC1332577F ,GetHashKey("HUD_CTX_GOLD_CURRENCY_CHANGE"))

        Citizen.InvokeNative(0xD4EE21B7CC7FD350, false)
        Citizen.InvokeNative(0x50C803A4CD5932C5, false)

        if GetMount(PlayerPedId()) ~= 0 then
            onhorse = true
        else
            onhorse = false
        end
        
        local myhealth = GetEntityHealth(PlayerPedId())
        local mystamina = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        local myhunger = exports["gum_metabolism"]:getHunger()
        local mythirst = exports["gum_metabolism"]:getThirst()
        local myalcohol = exports["gum_metabolism"]:getAlcohol()
        local mytemp = exports["gum_metabolism"]:getTemp()
        local horsestamina = Citizen.InvokeNative(0x36731AC041289BB1, GetMount(PlayerPedId()), 1)
        local horsehealth = Citizen.InvokeNative(0x36731AC041289BB1, GetMount(PlayerPedId()), 0)
        if myhealth == false then
            myhealth = 0
        end
        if mystamina == false then
            mystamina = 0
        end
        if hud == true then
            if IsCinematicCamRendering() == 1 then
                SendNUIMessage({show=false, health=myhealth, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina=mystamina, on_horse=false, horse_stamina=horsestamina, horse_health=horsehealth, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
            else
                SendNUIMessage({show=true, health=myhealth, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina=mystamina, on_horse=onhorse, horse_stamina=horsestamina, horse_health=horsehealth, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
            end
        else
            SendNUIMessage({show=false, health=myhealth, thirst=math.floor(mythirst), hunger=math.floor(myhunger), stamina=mystamina, on_horse=false, horse_stamina=horsestamina, horse_health=horsehealth, alcohol=myalcohol, temp=(2.5*mytemp),voice=voiceOn,volume=voiceVolume,minimap=YouNeedMinimap })
        end
    end
end)
if Config.Hudchange then
    RegisterCommand(Config.command, function()
        Menu_Hud()    
    end)

    function Menu_Hud()
        MenuData.CloseAll()
        local elements = {}
        if (compat == true) then
            table.insert(elements, {label =Config.Language[1].text, value="compass", desc="True"})
        else
            table.insert(elements, {label =Config.Language[1].text, value="compass", desc="false"})
        end

        if (map == true) then
            table.insert(elements, {label =Config.Language[5].text, value="minimap1", desc="False"})
        else
            table.insert(elements, {label =Config.Language[5].text, value="minimap1", desc="True"})
        end
        if (mapRadar == true) then
            table.insert(elements, {label =Config.Language[2].text, value="mapRadar", desc="map"})
        else
            table.insert(elements, {label =Config.Language[2].text, value="mapRadar", desc="radar"})
        end
        if (hud == true) then
            table.insert(elements, {label =Config.Language[3].text, value="true/falseHUD", desc="FALSE"})
        else
            table.insert(elements, {label =Config.Language[3].text, value="true/falseHUD", desc="rada"})
        end

        MenuData.Open('default', GetCurrentResourceName(), 'edrp_hud',
        {
            title    = Config.Language[50].text,
            subtext    = Config.Language[51].text,
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            if (data.current.value) == "compass" then
                if compat == true then
                    compass = true
                    compat = false
                    Menu_Hud()

                else
                    compass = false
                    compat = true
                    Menu_Hud()
                end
            end
            if (data.current.value) == "minimap1" then 
                if map == true then
                    SetMinimapType(1)
                    map = false
                    Menu_Hud()

                else
                    SetMinimapType(0)
                    map = true
                    Menu_Hud()
                end
            end
            if (data.current.value) == "mapRadar" then 
                if map == true and mapRadar == true then
                    SetMinimapType(3)
                    mapRadar = false
                    Menu_Hud()

                else
                    SetMinimapType(1)
                    mapRadar = true
                    Menu_Hud()
                end
            end
            if (data.current.value) == "true/falseHUD" then
                if hud == true then
                hud2 = false
                hud = false              
                Menu_Hud()
                else
                    hud = true
                    hud2 = true
                    Menu_Hud()
                end
            end
        end,
        function(data, menu)
            menu.close()
        end)
    end
end