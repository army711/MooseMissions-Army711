---@diagnostic disable: need-check-nil
-- Istanza CSAR per attivare la possibilità di CSAR dei piloti Umani --
-- Le unità che possono fare recupero si chiameranno " MEDEVAC "

local Csar_Loreair = CSAR:New(coalition.side.BLUE,"Pilota Eiettato","PilotaEiettato")

-- Funzioni di avviso onEvent --

function Csar_Loreair:OnAfterPilotDown(from, event, to, spawnedgroup, frequency, groupname, coordinates_text)
    MessageCSAR = MESSAGE:New("MAYDAY MAYDAY! Pilota Eiettato! Coordinate: " %coordinates_text)
    MessageCSAR:ToCoalition( coalition.side.BLUE )
end


-- Opzioni non default --

Csar_Loreair.immortalcrew = true -- il pilota è immortale
Csar_Loreair.invisiblecrew = false -- il pilota è visibile
Csar_Loreair.allowDownedPilotCAcontrol = true -- chi ha Combined Arms può spostare il pilota abbattuto
Csar_Loreair.autosmoke = true
Csar_Loreair.coordtype = 2
Csar_Loreair.pilotRuntoExtractPoint = true
Csar_Loreair.extractDistance = 200
Csar_Loreair.loadDistance = 30

-- Avvio istanza con delay di 5 secondi --

Csar_Loreair:__Start(5)

Mescsar=SOCKET:New()
Mescsar:SendText("CSAR Caricato!")