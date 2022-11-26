local Aoe_Projectile = Class(function(self, inst)
    self.inst = inst
    self.owner = nil   
    self.target = nil  
    self.start = nil
    self.dest = nil
    self.speed = nil
    self.hitdist = 1.5  
    self.dohit = true
    self.range = nil  
    self.onhit = nil
    self.onmiss = nil
	self.damage = 0
	self.launchoffset = Vector3(0.5, 0, 0)
end)

function Aoe_Projectile:GetDebugString()
    return string.format("target: %s, owner %s", tostring(self.target), tostring(self.owner) )
end

function Aoe_Projectile:SetSpeed(speed) 
    self.speed = speed
end

function Aoe_Projectile:SetRange(range) 
    self.range = range
end

function Aoe_Projectile:SetHitDist(dist) 
    self.hitdist = dist
end

function Aoe_Projectile:SetOnHitFn(fn)  
    self.onhit = fn
end

function Aoe_Projectile:SetOnMissFn(fn)  
    self.onmiss = fn
end

function Aoe_Projectile:SetLaunchOffset(offset)
    self.launchoffset = offset 
end

function Aoe_Projectile:Throw(owner, dest)
    self.owner = owner
    self.start = Vector3(owner.Transform:GetWorldPosition() ) 
    self.dest = dest 
    local offset = self.launchoffset
    if owner ~= nil and self.launchoffset ~= nil then
        local x, y, z = self.inst.Transform:GetWorldPosition()
        local facing_angle = owner.Transform:GetRotation() * DEGREES
        self.inst.Transform:SetPosition(x + self.launchoffset.x * math.cos(facing_angle), y + self.launchoffset.y, z - self.launchoffset.x * math.sin(facing_angle))
    end
    self:RotateToTarget(self.dest)
    self.inst.Physics:SetMotorVel(self.speed,0,0)
    self.inst:StartUpdatingComponent(self) 
end

function Aoe_Projectile:Miss()
    local owner = self.owner
    self:Stop()
    if self.onmiss then
        self.onmiss(self.inst, owner)
    end
end

function Aoe_Projectile:Stop()
    self.inst:StopUpdatingComponent(self)
    self.target = nil
    self.owner = nil
end

function Aoe_Projectile:Hit(target,owner)
	local attacker = owner
    local weapon = self.inst
    self:Stop()
    self.inst.Physics:Stop()
	if target.components.combat then
		target.components.combat:GetAttacked(self.owner, self.damage ,self.inst)
        target.components.combat:SuggestTarget(self.owner)
	end
    if self.onhit then
        self.onhit(self.inst, self.owner, target)
    end
end

function Aoe_Projectile:OnUpdate(dt)
	local x,y,z =  self.inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,0,z, self.hitdist)
    local dest = self.dest
    local current = Vector3(self.inst.Transform:GetWorldPosition() )
    local direction = (dest - current):GetNormalized()
    local projectedSpeed = self.speed*TheSim:GetTickTime()*TheSim:GetTimeScale()
    local projected = current + direction*projectedSpeed
    local coveredDistSq = distsq(self.start, current)
    if self.range and coveredDistSq > self.range*self.range then
        self:Miss() 
    elseif self.dohit then
		for i,v in pairs(ents) do
        if v and v:IsValid() and not v:IsInLimbo() and self.inst:IsNear(v, self.hitdist + (v.Physics and v.Physics:GetRadius() or 0)) and v ~=self.owner 
			and v.components.health ~=nil and v.components.combat ~=nil  and not v.components.health:IsDead() then
            self:Hit(v)
			self.target = v
		end
		end
    else
	--print("其他情况的说~喵~")
    end   
end

function Aoe_Projectile:RotateToTarget(dest)
    local current = Vector3(self.inst.Transform:GetWorldPosition() )
    local direction = (dest - current):GetNormalized()
    local angle = math.acos(direction:Dot(Vector3(1, 0, 0) ) ) / DEGREES
    self.inst.Transform:SetRotation(angle)
    self.inst:FacePoint(dest)
end

return Aoe_Projectile
