local function ACFGod( activated, entity, energy, frAera, angle, inflictor, bone, gun )
	local owner = entity:CPPIGetOwner()
	if owner and owner:IsValid() and owner:IsPlayer() and owner.ACFGod then
		return false
	end
	return true
end
hook.Add( "ACF_BulletDamage", "Source.ACFGod", ACFGod )
