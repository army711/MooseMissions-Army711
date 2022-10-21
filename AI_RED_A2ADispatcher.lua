-- Inizializzazione
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes({"EWRED"})
DetectionSetGroup:FilterStart()

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000)

A2aRedDispatcher=AI_A2A_DISPATCHER:New( Detection )
--A2aRedDispatcher:__Start(5)

-- Inizializzazione Tanker
local ZoneTankerRED=ZONE:New("ZoneRedTanker")
local TankerAuftragRED=AUFTRAG:NewTANKER(ZoneTankerRED:GetCoordinate(), 25000, 370, 359, 45, 1)
TankerAuftragRED:SetTime("8:00", "19:00")
TankerAuftragRED:SetImmortal(true)
local TankerAuftragREDGroup=FLIGHTGROUP:New("REDTanker")
TankerAuftragREDGroup:Activate()
TankerAuftragREDGroup:AddMission(TankerAuftragRED)

local ZoneTankerRED2=ZONE:New("ZoneRedTanker2")
local TankerAuftragRED2=AUFTRAG:NewTANKER(ZoneTankerRED2:GetCoordinate(), 25000, 370, 359, 45, 1)
TankerAuftragRED:SetTime("8:00", "19:00")
TankerAuftragRED:SetImmortal(true)
local TankerAuftragREDGroup=FLIGHTGROUP:New("REDTanker2")
TankerAuftragREDGroup:Activate()
TankerAuftragREDGroup:AddMission(TankerAuftragRED2)


-- Inizializzazione confini del cap

RedBorderZone = ZONE_POLYGON:New( "ConfiniRED", GROUP:FindByName( "ConfiniRED"))
A2aRedDispatcher:SetBorderZone( { RedBorderZone })

-- Impostazione Engage Radius

A2aRedDispatcher:SetEngageRadius( 165000 )

-- Impostazione Squadroni

A2aRedDispatcher:SetSquadron( "TbilisiEASY", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Easy-1 F2-G", "ARENA Easy-1 F2-F3-G", "ARENA Easy-1 G" }, 100)
A2aRedDispatcher:SetSquadron( "TbilisiMED", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Medium-1 G", "ARENA Medium-1 F2-G", "ARENA Medium-1 F2-F3-G" }, 100)
A2aRedDispatcher:SetSquadron( "TbilisiHARD", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Hard-1 G","ARENA Hard-1 F2-G","ARENA Hard-1 F2-F3-G" }, 100)

A2aRedDispatcher:SetSquadronGrouping( "TbilisiEASY", 2)
A2aRedDispatcher:SetSquadronGrouping( "TbilisiMED", 2)
A2aRedDispatcher:SetSquadronGrouping( "TbilisiHARD", 2)

A2aRedDispatcher:SetDefaultTakeoffFromParkingCold()
A2aRedDispatcher:SetDefaultLandingAtEngineShutdown()
A2aRedDispatcher:SetDefaultFuelThreshold( 0.4 )
A2aRedDispatcher:SetSquadronFuelThreshold( "TbilisiEASY", 0.5 )

-- Impostazione Ground Controlled Intercept GCI

A2aRedDispatcher:SetGciRadius( 50000 )

-- Impostazione Aree CAP

CAPZoneEasy = ZONE:New( "REDCAPZoneEASY" )
CAPZoneMed = ZONE:New( "REDCAPZoneMED")
CAPZoneHard = ZONE:New( "REDCAPZoneHARD")
A2aRedDispatcher:SetSquadronCap( "TbilisiEASY", CAPZoneEasy, 6000, 10000, 550, 750, 800, 1200, "BARO")
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiEASY", 2, 300, 600)
A2aRedDispatcher:SetSquadronCap( "TbilisiMED", CAPZoneMed, 6000, 10000, 550, 750, 800, 1200, "BARO")
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiMED", 1, 300, 600)
A2aRedDispatcher:SetSquadronCap( "TbilisiHARD", CAPZoneHard, 6000, 10000, 550, 750, 800, 1200, "BARO")
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiHARD", 1, 300, 600)

A2aRedDispatcher:SetDefaultTanker( "REDTanker" )
A2aRedDispatcher:SetSquadronTanker( "TbilisiEASY", "REDTanker2")

