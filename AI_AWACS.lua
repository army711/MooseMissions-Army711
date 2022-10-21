local AwacsPatrolZone = ZONE:New("AwacsPatrol")

local AwacsPatrolAuftrag = AUFTRAG:NewAWACS(AwacsPatrolZone:GetCoordinate(), 30000, 350, 232, 70)
AwacsPatrolAuftrag:SetTime("8:00", "20:00")
AwacsPatrolAuftrag:SetTACAN(29, "AWA")
AwacsPatrolAuftrag:SetRadio(247)
AwacsPatrolAuftrag:SetImmortal(true)

local AwacsFlightGroup=FLIGHTGROUP:New("RECON - E3")
AwacsFlightGroup:SetDefaultCallsign(CALLSIGN.AWACS.Darkstar, 1)

AwacsFlightGroup:AddMission(AwacsPatrolAuftrag)