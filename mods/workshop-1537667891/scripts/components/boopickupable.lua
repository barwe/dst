local BooPickupable = Class(function(self, inst)
	self.inst = inst
	self.onpickupfn = nil    
end)
function BooPickupable:SetOnPickupFn(fn)
	self.onpickupfn = fn
end
function BooPickupable:CanPickUp()
	if self.canpickupfn then
		return self.canpickupfn(self.inst)
	end
	return self.canbepickedup
end
function BooPickupable:OnPickup(pickupguy)
	if self.inst.components.burnable and self.inst.components.burnable:IsSmoldering() then
		self.inst.components.burnable:StopSmoldering()
		if pickupguy.components.health then
			pickupguy.components.health:DoFireDamage(TUNING.SMOTHER_DAMAGE, nil, true)
			pickupguy:PushEvent("burnt")
		end
	end
	self.inst.Transform:SetPosition(0,0,0)
	self.inst:PushEvent("onpickup", {owner = pickupguy})
	if self.onpickupfn and type(self.onpickupfn) == "function" then
		return self.onpickupfn(self.inst, pickupguy)
	end
end
return BooPickupable
