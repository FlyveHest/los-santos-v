local reportedPlayers = { }
local reportingPlayer = nil
local reportingReasons = { "Harassment", "Cheating", "Spam" }


AddEventHandler('lsv:init', function()
	while true do
		if WarMenu.IsMenuOpened('reportPlayer') then
			for i = 0, Settings.maxPlayerCount do
				if i ~= PlayerId() and NetworkIsPlayerActive(i) then
					local target = GetPlayerServerId(i)
					if not Utils.Index(target, reportedPlayers) and WarMenu.MenuButton(GetPlayerName(i), 'reportReason') then 
						reportingPlayer = target
					end
				end
			end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('reportReason') then
			for _, reason in ipairs(reportingReasons) do
				if WarMenu.Button(reason) then
					TriggerServerEvent('lsv:reportPlayer', reportingPlayer, reason)
					table.insert(reportedPlayers, reportingPlayer)
					reportingPlayer = nil
					WarMenu.CloseMenu()
				end
			end

			WarMenu.Display()
		end

		Citizen.Wait(0)
	end
end)


RegisterNetEvent('lsv:reportSuccess')
AddEventHandler('lsv:reportSuccess', function()
	Gui.DisplayNotification('~g~Thank you for reporting.')
end)


RegisterNetEvent('lsv:reportError')
AddEventHandler('lsv:reportError', function()
	Gui.DisplayNotification('~r~An unexpected error occurred while trying to send Player Report.')
end)