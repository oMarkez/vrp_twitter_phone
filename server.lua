--[[ 
	vrp_twitter_phone
    Copyright (C) 2018  VHdk

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_atm")

local ch_sendtweet = {function(player,choice)
    local user_id = vRP.getUserId({player})

	vRP.prompt({player,"Twitter Message:","",function(player,msg)
        	if msg and msg ~= "" then
			vRP.getUserIdentity({user_id, function(identity)

                		TriggerClientEvent('chatMessage', -1, "^4TWITTER | ^5@"..""..identity.firstname.." "..identity.name.."", { 10, 205, 245 }, msg)
            		end})
		else
			vRPclient.notify(player,{"~r~You have to write a message."})
		end
	end})
end,"Send a Twitter message."}

vRP.registerMenuBuilder({"phone", function(add)
    local choices = {}

    choices["Twitter"] = ch_sendtweet 

    add(choices)
end})
