-- Skill Damage Changes v1.0.0
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")
Helper = require("./helper")

local init = false



-- ========== Main ==========

local function edit_skill_damage(id, damage, description)
    description = description or nil
    gm.array_set(gm.variable_global_get("class_skill")[id], 7, damage)
    if description then gm.array_set(gm.variable_global_get("class_skill")[id], 3, description) end
end


gm.pre_script_hook(gm.constants.__input_system_tick, function()
    -- Change skill values
    if not init then
        init = true
        
        -- [Commando]
        -- Double Tap:          60% -> 65%
        edit_skill_damage(2, 0.65, "Shoot rapidly for <y>65% damage.</c>")
        -- Full Metal Jacket:   230% -> 260%
        edit_skill_damage(3, 2.6, "Shoot <y>through enemies</c> for <y>260% damage, knocking them back.</c>")
        -- Suppressive Fire:    6x60% -> 6x65%
        edit_skill_damage(5, 0.65, "Fire rapidly, <y>stunning</c> and hitting nearby enemies for <y>6x65% damage.</c>")
        edit_skill_damage(6, 0.65, "Fires rapidly, <y>stunning</c> and hitting nearby enemies for <y>10x65% damage.</c>")

        
        -- [Enforcer]
        -- Shrapnel Grenade:    3x60% -> 3x70%
        edit_skill_damage(16, 0.7, "Fire a <b>shrapnel grenade</c>, exploding for <y>3x70% damage</c>. <b>Holds up to 4 grenades</c>, reactivate when empty to <y>reload your weapon</c>.")

        
        -- [Bandit]
        -- Blast:               80% -> 90%
        edit_skill_damage(22, 0.9, "Fire a powerful slug for <y>90% damage.</c>")
        -- Lights Out:          500% -> 600%
        edit_skill_damage(25, 6.0, "Take aim for a headshot, dealing <y>600% damage</c>. If this ability <r>kills an enemy</c>, the Bandit's <b>cooldowns are all reset to 0.</c>")
        edit_skill_damage(26, 6.0, "Take aim a headshot for <y>2x600% damage</c>. If this ability <r>kills an enemy</c>, the Bandit's <b>cooldowns are all reset to 0.</c>")
        -- Standoff:            500% -> 600%
        edit_skill_damage(29, 6.0, "Take aim for a headshot, dealing <y>600% damage</c>. If this ability <r>kills an enemy</c>, gain 1 temporary stack of <b>Standoff.</c>\n<b>Standoff</c> stacks increase <y>damage by 50%</c> each and last 15 seconds.")
        edit_skill_damage(30, 6.0, "Take aim a headshot for <y>2x600% damage</c>. If this ability <r>kills an enemy</c>, gain 1 temporary stack of <b>Standoff.</c><b>Standoff</c> stacks increase <y>damage by 50%</c> each and last 20 seconds.")


        -- [Engineer]
        -- Shockwave Mine:      120% -> 250%
        edit_skill_damage(55, 2.5, "<y>Drop a defensive mine</c> that knocks enemies back a significant distance for <y>250% damage</c>. Can trigger up to 3 times.\n<b>Hold up to 3.</c>")
        

        -- [Sniper]
        -- Heavy Recoil:        200% -> 320%
        edit_skill_damage(75, 3.2, "<y>Fire at the ground,</c> launching yourself up and away. Deals <y>320% damage</c>.")


        -- [Mercenary]
        -- Whirlwind:           2x80% -> 2x125%
        edit_skill_damage(85, 1.25, "Quickly slice twice, dealing <y>2x125% damage</c> to all nearby enemies.")


        -- [CHEF]
        -- SLICE:               125% -> 200%
        edit_skill_damage(107, 2.0, "STRETCH YOUR ARMS AND SLASH CUSTOMERS FOR <y>200% DAMAGE.</c>")
        -- COOK:                6x50% -> 6x80%
        -- Description is already correct
        edit_skill_damage(109, 0.8)
        edit_skill_damage(110, 0.8)
    end
end)