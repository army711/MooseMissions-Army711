-------------------------------------------
-- ATIS per la missione di Addestramento --
-------------------------------------------

-- ATIS Kutaisi --

AtisKutaisi=ATIS:New(AIRBASE.Caucasus.Kutaisi, 134.75)
AtisKutaisi:SetRadioRelayUnitName("Radio Relay Kutaisi")
AtisKutaisi:SetTowerFrequencies({134.000, 263.000})
AtisKutaisi:AddILS(109.75, "07")
AtisKutaisi:SetTACAN(44)
AtisKutaisi:Start()

-- ATIS Senaki_Kolkhi --

AtisSenaki=ATIS:New(AIRBASE.Caucasus.Senaki_Kolkhi, 132.75)
AtisSenaki:SetRadioRelayUnitName("Radio Relay Senaki")
AtisSenaki:SetTowerFrequencies({132.000, 261.000})
AtisSenaki:SetTACAN(31)
AtisSenaki:Start()

-- ATIS Sukhumi_Babushara --

AtisSukhumi=ATIS:New(AIRBASE.Caucasus.Sukhumi_Babushara, 129.75)
AtisSukhumi:SetRadioRelayUnitName("Radio Relay Sukhumi")
AtisSukhumi:SetTowerFrequencies({129.000, 258.000})
AtisSukhumi:SetTACAN(57)
AtisSukhumi:SetVOR(116.00)
AtisSukhumi:Start()

-- ATIS Batumi

AtisBatumi=ATIS:New(AIRBASE.Caucasus.Batumi, 131.75)
AtisBatumi:SetRadioRelayUnitName("Radio Relay Batumi")
AtisBatumi:SetTowerFrequencies({131.000, 260.000})
AtisBatumi:AddILS(110.30, "13")
AtisBatumi:SetTACAN(16)
AtisBatumi:Start()

local airbases=AIRBASE.GetAllAirbases()
for _,_airbase in pairs(airbases) do
  local airbase=_airbase --Wrapper.Airbase#AIRBASE
  airbase:GetRunwayData(nil, true)
end


Mesatis=SOCKET:New()
Mesatis:SendText("ATIS Caricato!")