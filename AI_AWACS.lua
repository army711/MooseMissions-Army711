-- Dichiarazione della patrol zone. "AwacsPatrol" sarà il nome di una zona trigger da creare nel mission Editor

local AwacsPatrolZone = ZONE:New("AwacsPatrol")

-- Qui si metteranno tutte le impostazioni necessarie per l' AUFTRAG per gestire l'awacs. 
-- con AUFTRAG:NewAWACS creeremo la missione Awacs prendendo come punto di partenza la zona creata nel ME

local AwacsPatrolAuftrag = AUFTRAG:NewAWACS(AwacsPatrolZone:GetCoordinate(), 30000, 350, 232, 70) -- vengono prese le coordinate della zona creata, la quota, la velocità, la direzione da seguire e la lunghezza della leg dell'awacs. 
AwacsPatrolAuftrag:SetTime("8:00", "20:00") -- l'orario di operazioni in Missione , l'awacs tornerà automaticamente alla base per refuel e ritornerà in volo
AwacsPatrolAuftrag:SetTACAN(29, "AWA") -- TACAN e codice morse 
AwacsPatrolAuftrag:SetRadio(247) -- Frequenza radio che utilizzerà l'awacs
AwacsPatrolAuftrag:SetImmortal(true) -- Impostato come immortale per evitare problemi

-- Ora verrà creato il FLIGHTGROUP , quindi verrà utilizzata una unità chiamata "RECON - E3" (nome del gruppo) messa nel ME con l'opzione "Late Activation" attivata.
local AwacsFlightGroup=FLIGHTGROUP:New("RECON - E3") -- dichiarazione variabile "AwacsFlightGroup" utilizzando la classe "FLIGHTGROUP"
AwacsFlightGroup:SetDefaultCallsign(CALLSIGN.AWACS.Darkstar, 1) -- impostazione del CALLSIGN che verrà utilizzato dall'Awacs 

AwacsFlightGroup:AddMission(AwacsPatrolAuftrag) -- Avvio script.