local function ignore( self )
	self.ignore_ = not self.ignore_
end

local Yoyozi_KeyHandler = Class(function(self, inst)
	self.inst = inst
	self.paused = false
	self.ignore_ = false
	self.ignore_event = net_event(self.inst.GUID, "ignore")
	self.handler = TheInput:AddKeyHandler(function(key, down) self:OnRawKey(key, down) end )
	
	self.inst:ListenForEvent( "gamepaused", function(inst, paused) self.paused = paused end )
	self.inst:ListenForEvent( "ignore", function(inst)
		ignore( inst.components.yoyozi_keyhandler )
	end)
end)

local function check(my)
	local com = "否\n"
	local isdead = "否\n"
	local pghost = "否\n"
	local ghost = "否\n"
	if my.components.health ~= nil then 
		com = "是\n"
	end
	if my.components.health ~= nil and my.components.health:IsDead() then
		isdead = "是\n"
	end
	if my:HasTag("playerghost") then 
		pghost = "是\n"
	end
	if my:HasTag("ghost") then 
		ghost = "是\n"
	end
	local str = "人物:  "..my.prefab.."  玩家名字:  "..my.name.."\n是否有health组件:  "..com.."是否isdead():  "..isdead.."是否有playerghost标签:  "..pghost.."是否有ghost标签:  "..ghost
	print(str)
	return str
end 

function Yoyozi_KeyHandler:StartIgnoring()
	self.ignore_event:push()
end

function Yoyozi_KeyHandler:StopIgnoring()
	self.ignore_event:push()
end

function Yoyozi_KeyHandler:OnRawKey(key, down)
	local player = ThePlayer
	if player ~= nil then
  		if (key and not down) and not self.paused and not self.ignore_ then
      			player:PushEvent("keyup", {inst = self.inst, player = player, key = key})
		elseif key and down and not self.paused and not self.ignore_ then
      			player:PushEvent("keydown", {inst = self.inst, player = player, key = key})
		end
  	end
end

function Yoyozi_KeyHandler:AddActionListener(Namespace, Key, Action, Event)

	if Event == nil then
		self.inst:ListenForEvent("keyup", function(inst, data)
			if data.inst == ThePlayer then
				if data.key == Key then
				
					local skilltable = 
					{
						--["zg_hantian"] = "_hantian",
						["yoyozi_kill"] = "_kill",
						["yoyozi_haunt"] = "_haunt",
						["yoyozi_ghost"] = "_ghost",
						--["yoyozi_night"] = "_night",
					}
					
					local cdtable = 
					{
						--["zg_hantian"] = 1,
						["yoyozi_kill"] = 0,
						["yoyozi_haunt"] = 0,
						["yoyozi_ghost"] = 0,
						--["yoyozi_night"] = 0,
					}
				
					----
					if not ThePlayer:HasTag("playerghost") 
						--not ThePlayer.sg:HasStateTag("tent") and 
						--not ThePlayer.sg:HasStateTag("skill") and 
						-- and ThePlayer[ skilltable[Action] ] == true 
						
					then
						--check(ThePlayer)
						--
						--if not ( ThePlayer[ skilltable[Action.."_ok"] ] or ThePlayer.components.timer:TimerExists( skilltable[Action.."_ok"] ) ) then
						--	ThePlayer.components.timer:StartTimer(skilltable[Action].."_ok", .1)
						--end
						
						--
						ThePlayer[ skilltable[Action] ] = true --------------
						--[[if not ( ThePlayer[ skilltable[Action] ] or ThePlayer.components.timer:TimerExists( skilltable[Action] ) ) then
							ThePlayer.components.timer:StartTimer( skilltable[Action], cdtable[Action] )
						end--]]-------------------------
				
						local x,y,z = ( TheInput:GetWorldPosition() or Vector3(0,0,0) ):Get()
						if TheWorld.ismastersim then
							ThePlayer:PushEvent("keyaction"..Namespace..Action, 
							{ Namespace = Namespace, Action = Action, Fn = MOD_RPC_HANDLERS[Namespace][MOD_RPC[Namespace][Action].id], x = x, y = y, z = z})
						else
							--print("ok")
							SendModRPCToServer( MOD_RPC[Namespace][Action], x,y,z)
						end
						
					else
					-------------------------------!
							local str = check(ThePlayer)
							--print(str)
							if ThePlayer.components.talker  then
								ThePlayer.components.talker:Say(str)
							end
					end
				end
			end	
		end)
	elseif Event ~= nil then
		self.inst:ListenForEvent(string.lower(Event), function(inst, data)
			if data.inst == ThePlayer then
				if data.key == Key then
					if TheWorld.ismastersim then
						ThePlayer:PushEvent("keyaction"..Namespace..Action, 
						{ Namespace = Namespace, Action = Action, Fn = MOD_RPC_HANDLERS[Namespace][MOD_RPC[Namespace][Action].id]})
					else
						SendModRPCToServer( MOD_RPC[Namespace][Action])
					end
				end
			end	
		end)
	end

	if TheWorld.ismastersim then
		self.inst:ListenForEvent("keyaction"..Namespace..Action, function(inst, data)
			if not data.Action == Action and not data.Namespace == Namespace then
				return
			end

          		data.Fn(inst, data.x, data.y, data.z)
		end, self.inst) 
	end
end

return Yoyozi_KeyHandler