---@diagnostic disable: need-check-nil
-- Dichiarazione Tanker
local ZoneTankerArco=ZONE:New("ZoneArco")
local ZoneTankerShell=ZONE:New("ZoneShell")
local ZoneTankerTexaco=ZONE:New("ZoneTexaco")


-- Dichiarazione AUFTRAG
local TankerAuftragArco=AUFTRAG:NewTANKER(ZoneTankerArco:GetCoordinate(), 23000, 290, 357, 32, 0)
TankerAuftragArco:SetTime("8:00", "19:00")
TankerAuftragArco:SetTACAN(12, "ARC")
TankerAuftragArco:SetRadio(252)
TankerAuftragArco:SetImmortal(true)

local TankerAuftragShell=AUFTRAG:NewTANKER(ZoneTankerShell:GetCoordinate(), 26000, 283, 357, 50, 1)
TankerAuftragShell:SetTime("8:00", "19:00")
TankerAuftragShell:SetTACAN(11, "SHE")
TankerAuftragShell:SetRadio(253)
TankerAuftragShell:SetImmortal(true)

local TankerAuftragTexaco=AUFTRAG:NewTANKER(ZoneTankerTexaco:GetCoordinate(), 18000, 290, 1, 50, 1)
TankerAuftragTexaco:SetTime("8:00", "19:00")
TankerAuftragTexaco:SetTACAN(13, "TXC")
TankerAuftragTexaco:SetRadio(251)
TankerAuftragTexaco:SetImmortal(true)

-- Creazione FlightGroup
local TankerAuftragArcoGroup=FLIGHTGROUP:New("ARCO")
TankerAuftragArcoGroup:SetDefaultCallsign(CALLSIGN.Tanker.Arco, 1)
TankerAuftragArcoGroup:SetDefaultRadio(255)
TankerAuftragArcoGroup:Activate()

local TankerAuftragShellGroup=FLIGHTGROUP:New("SHELL")
TankerAuftragShellGroup:SetDefaultCallsign(CALLSIGN.Tanker.Shell, 1)
TankerAuftragShellGroup:SetDefaultRadio(255)
TankerAuftragShellGroup:Activate()

local TankerAuftragTexacoGroup=FLIGHTGROUP:New("TEXACO")
TankerAuftragTexacoGroup:SetDefaultCallsign(CALLSIGN.Tanker.Texaco, 1)
TankerAuftragTexacoGroup:SetDefaultRadio(255)
TankerAuftragTexacoGroup:Activate()


-- Assegna Missioni ai piloti
TankerAuftragArcoGroup:AddMission(TankerAuftragArco)
TankerAuftragShellGroup:AddMission(TankerAuftragShell)
TankerAuftragTexacoGroup:AddMission(TankerAuftragTexaco)
