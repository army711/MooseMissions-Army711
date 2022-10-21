-- Inizializzazione
-- Questa parte creerà un nuovo Gruppo nel Database del MOOSE , aggiungendo tutti i gruppi del ME con prefisso "EWRED"
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes({"EWRED"})
DetectionSetGroup:FilterStart()

-- Creiamo un'oggetto chiamato "Detection" che unirà tutte le zone coperte da Radar e unirà insieme i gruppi di bersagli entro un raggio di 30Km

Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000)

-- Attiviamo la funzione di A2A Dispatcher gestita da AI , utilizzando come Radar i gruppi creati prima "Detection"

A2aRedDispatcher=AI_A2A_DISPATCHER:New( Detection )

-- Inizializzazione Tanker
-- Tanker 1 , seguirà dalle coordinate della zona trigger "ZoneRedTanker" a 25000 piedi , 370knts (Ground Speed), direzione 359°, per 45 Nm di leg, con impostazione "Basket"
local ZoneTankerRED=ZONE:New("ZoneRedTanker")
local TankerAuftragRED=AUFTRAG:NewTANKER(ZoneTankerRED:GetCoordinate(), 25000, 370, 359, 45, 1)
TankerAuftragRED:SetTime("8:00", "19:00")
TankerAuftragRED:SetImmortal(true)
local TankerAuftragREDGroup=FLIGHTGROUP:New("REDTanker")
TankerAuftragREDGroup:Activate()
TankerAuftragREDGroup:AddMission(TankerAuftragRED)

-- Tanker 2 , seguirà dalle coordinate della zona trigger "ZoneRedTanker2" con le stesse impostazioni di prima.

local ZoneTankerRED2=ZONE:New("ZoneRedTanker2")
local TankerAuftragRED2=AUFTRAG:NewTANKER(ZoneTankerRED2:GetCoordinate(), 25000, 370, 359, 45, 1)
TankerAuftragRED:SetTime("8:00", "19:00")
TankerAuftragRED:SetImmortal(true)
local TankerAuftragREDGroup=FLIGHTGROUP:New("REDTanker2")
TankerAuftragREDGroup:Activate()
TankerAuftragREDGroup:AddMission(TankerAuftragRED2)

-- Qui si inizierà a creare la missione di CAP che seguiranno gli aerei aggiunti nel ME come Late Activation e tassativamente 1 aereo per gruppo creato. MOOSE deciderà quanto grandi saranno i gruppi
-- Inizializzazione confini del cap

RedBorderZone = ZONE_POLYGON:New( "ConfiniRED", GROUP:FindByName( "ConfiniRED")) -- "ConfiniRED" è un elicottero in Late Activation , in aria , che avrà come rotta impostata i confini della zona in cui gli aerei ingaggeranno i nemici. 
A2aRedDispatcher:SetBorderZone( { RedBorderZone })

-- Impostazione Engage Radius dall'unità in cap

A2aRedDispatcher:SetEngageRadius( 165000 )

-- Impostazione Squadroni
-- Qui dichiariamo gli Squadroni disponibili al Dispatcher per le missioni di CAP . verranno gestite in autonomia e fatti partire dagli aeroporti che imposteremo all'interno. I template in Late Activation non devono essere messi a terra nell'aeroporto
-- ma possono essere messi in aria ad un lato della mappa. gli Squadroni sono oggetti tipo "table" , quindi devono essere racchiusi in parentesi graffe, anche se fosse un solo gruppo

A2aRedDispatcher:SetSquadron( "TbilisiEASY", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Easy-1 F2-G", "ARENA Easy-1 F2-F3-G", "ARENA Easy-1 G" }, 100)
A2aRedDispatcher:SetSquadron( "TbilisiMED", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Medium-1 G", "ARENA Medium-1 F2-G", "ARENA Medium-1 F2-F3-G" }, 100)
A2aRedDispatcher:SetSquadron( "TbilisiHARD", AIRBASE.Caucasus.Tbilisi_Lochini, { "ARENA Hard-1 G","ARENA Hard-1 F2-G","ARENA Hard-1 F2-F3-G" }, 100)

-- Dichiariamo da quanti aerei dovranno essere creati i gruppi CAP . 

A2aRedDispatcher:SetSquadronGrouping( "TbilisiEASY", 2)
A2aRedDispatcher:SetSquadronGrouping( "TbilisiMED", 2)
A2aRedDispatcher:SetSquadronGrouping( "TbilisiHARD", 2)

-- Impostazioni varie

A2aRedDispatcher:SetDefaultTakeoffFromParkingCold() -- Tutti gli aerei partiranno dal Parking nell'aeroporto dichiarato prima da spenti
A2aRedDispatcher:SetDefaultLandingAtEngineShutdown() -- Tutti gli aerei verranno despawnati solo quando saranno atterrati e al parking con motore spento
A2aRedDispatcher:SetDefaultFuelThreshold( 0.4 ) -- limite default di carburante per rientrare o iniziare il refuelling (Es. 0.4 = 40% )
A2aRedDispatcher:SetSquadronFuelThreshold( "TbilisiEASY", 0.5 ) -- Limite specifico per rientrare alla base per lo squadrone "TbilisiEASY" impostato con carburante al 50%

-- Impostazione Ground Controlled Intercept GCI

A2aRedDispatcher:SetGciRadius( 50000 ) -- Questo è un concetto abbastanza particolare. la Ground Controlled Intercept è un'area intorno all'aeroporto che farà partire tutti gli squadroni in quella zona
-- in questo caso 50000 metri , quindi entro 50Km . 

-- Impostazione Aree CAP
-- Creiamo i nuovi oggetti CAPZone per decidere le zone dove verrà effettuato il cap e le varie opzioni. le zone nel ME saranno delle trigger zone con gli stessi nomi impostati qui . 
CAPZoneEasy = ZONE:New( "REDCAPZoneEASY" )
CAPZoneMed = ZONE:New( "REDCAPZoneMED")
CAPZoneHard = ZONE:New( "REDCAPZoneHARD")
A2aRedDispatcher:SetSquadronCap( "TbilisiEASY", CAPZoneEasy, 6000, 10000, 550, 750, 800, 1200, "BARO") -- Lo squadrone TbilisiEASY andra nella zona dichiarata in CAPZoneEasy, ad una quota tra i 6000 e 10000 metri, ad una velocità 
-- di crociera tra i 550Km/h e i 750Km/h , e una velocità di ingaggio minima di 800Kmh e massima di 1200Kmh. Le misure di altitudine saranno Barometriche e non Radar. 
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiEASY", 2, 300, 600)
A2aRedDispatcher:SetSquadronCap( "TbilisiMED", CAPZoneMed, 6000, 10000, 550, 750, 800, 1200, "BARO")
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiMED", 1, 300, 600)
A2aRedDispatcher:SetSquadronCap( "TbilisiHARD", CAPZoneHard, 6000, 10000, 550, 750, 800, 1200, "BARO")
A2aRedDispatcher:SetSquadronCapInterval( "TbilisiHARD", 1, 300, 600)

A2aRedDispatcher:SetDefaultTanker( "REDTanker" ) -- il tanker impostato default è il gruppo nel mission editor "REDTanker"
A2aRedDispatcher:SetSquadronTanker( "TbilisiEASY", "REDTanker2") -- lo Squadrone TbilisiEASY utilizzerà invece il secondo Tanker. 

