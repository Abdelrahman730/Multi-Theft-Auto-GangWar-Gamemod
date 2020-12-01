--[[function FastFire()
local Weapon = getPedWeapon ( getLocalPlayer())
if (Weapon == 24) then
elseif (Weapon == 25) then
setPedWeaponSlot ( getLocalPlayer(), 0 )
setPedWeaponSlot ( getLocalPlayer(), 3 )
elseif (Weapon == 34) then
setPedWeaponSlot ( getLocalPlayer(), 0 )
setPedWeaponSlot ( getLocalPlayer(), 6 )
elseif (Weapon == 33) then
setPedWeaponSlot ( getLocalPlayer(), 0 )
setPedWeaponSlot ( getLocalPlayer(), 6 )
end
end
bindKey ( "crouch", "down", FastFire )]]