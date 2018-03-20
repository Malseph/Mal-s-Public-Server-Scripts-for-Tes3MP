--I did my best to "convert" this to a version everyone else could use. This was put together quickly, but it works fine.
--Don't bother using this if you don't understand how to modify anything yourself. 
--You will need 1. A delete packet function, and 2. To modify SaveObjectStates so that "ConsoleSpamPrevention" can get what it depends on

Methods.ConsoleSpamPrevention = function(pid, refIndex, refId, cellDescription)
	local Name = refId.."-Spam"
	if Players[pid].StateSpam == nil then
		Players[pid].StateSpam = {}
	end	
	if Players[pid].StateSpam[Name] == nil then
		Players[pid].StateSpam[Name] = 0
	else	
		Players[pid].StateSpam[Name] = (Players[pid].StateSpam[Name] + 1)
		if Players[pid].StateSpam[Name] >= 5 then -- If the player gets 5 false object states for the same refid in that cell, delete it.
			--Optional: Insert your own cell load check here. Make sure its loaded. I would add mine, but it is full of extra stuff.
			--Insert Your own Delete packet here for the RefIndex! I would add mine, but is full of extra stuff. Just make sure you only send it to the player that sets that state false (As seen below)
			tes3mp.LogMessage(1, "- " .. refIndex .. " with refId: "..refId.." was causing spam and has been deleted")			
		end
	end	
end

--Add this to SaveObjectStates in the cell base file and modify SaveObjectStates
if state == false then
	myMod.ConsoleSpamPrevention(pid, refIndex, refId, self.description)
end		
