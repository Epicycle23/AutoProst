local ProstVariations = {
    [0] = "Gan bei!",
    [1] = "Vashi!",
    [2] = "Gezuar!",
    [3] = "Tim-tim!",
    [4] = "Skal!",
    [5] = "Santé!",
    [6] = "Salute!",
    [7] = "Proost, op uw gezondheid!",
    [8] = "Vashe zdorovie!",
    [9] = "Salud!",
    [10] = "Chokdee!",
    [11] = "Serefe!",
    [12] = "Yamas!",
}
local MaxProstVariationIndex = #ProstVariations
local function OnGuildMessageProst()
    SendChatMessage(ProstVariations[math.random(0,MaxProstVariationIndex)],"GUILD")
end
local GuildMessageHandlers = {
    ["prost!"] = OnGuildMessageProst,
}



local AutoProstEventFrame = CreateFrame("Frame", "AutoProstEventFrame")

local function OnEvent(self, event, ...)
    if (event == "CHAT_MSG_GUILD") then
        local message, sender = ...
        if(sender == UnitName("player")) then
            do return end
        end
        local lowerMessage = string.lower(message)
        local handler = GuildMessageHandlers[lowerMessage]
        if(handler) then
            handler()
        else
            if(string.match(lowerMessage, "^prost *!*$")) then
                OnGuildMessageProst()
            end 
        end
    end
end

AutoProstEventFrame:RegisterEvent("CHAT_MSG_GUILD")
AutoProstEventFrame:SetScript("OnEvent", OnEvent)