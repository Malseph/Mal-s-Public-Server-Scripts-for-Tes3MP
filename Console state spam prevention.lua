--I did my best to "convert" this to a version everyone else could use. This was put together quickly, but it works fine.

Methods.ConsoleSpamPrevention = function(pid, refIndex, refId, cellDescription)
	local Name = refId.."-Spam"
	if Players[pid].StateSpam == nil then
		Players[pid].StateSpam = {}
	end	
	if Players[pid].StateSpam[Name] == nil then
		Players[pid].StateSpam[Name] = 0
	else	
		Players[pid].StateSpam[Name] = (Players[pid].StateSpam[Name] + 1)
		if Players[pid].StateSpam[Name] >= 5 then
			--Insert your own cell load check here. Make sure its loaded. I would add mine, but it is full of extra stuff.
			--Insert Your own Delete packet here for the RefIndex! I would add mine, but is full of extra stuff.
			tes3mp.LogMessage(1, "- " .. refIndex .. " with refId: "..refId.." was causing spam and has been deleted")			
		end
	end	
end

--Add this to SaveObjectStates in the cell base file
if state == false then
	myMod.ConsoleSpamPrevention(pid, refIndex, refId, self.description)
end		
